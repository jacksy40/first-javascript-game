# Use this file to import the sales information into the
# the database.
require "pg"
require "csv"
require 'pry'


def empid element
  ekey = db_connection{ |connect| connect.exec("SELECT employee_id FROM employees where employee_name='#{element}'") }.to_a
  employee_key = ekey[0].values
  return employee_key[0]
end

def custid element
  ckey = db_connection{ |connect| connect.exec("SELECT customer_id FROM customers where customer='#{element}'") }.to_a
  customer_key = ckey[0].values
  return customer_key[0]
end

def prodid element
  pkey = db_connection{ |connect| connect.exec("SELECT product_id FROM products where product='#{element}'") }.to_a
  product_key = pkey[0].values
  return product_key[0]
end

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

def verify(element, column, table)
     value = db_connection{ |connect| connect.exec("SELECT #{column} FROM #{table} where #{column}='#{element}'") }.to_a
     if value.empty?
      return true
    else
      return false
     end
end


def employee_upload file
convert = []
  CSV.foreach(file) do |row|
    convert << row
  end
  convert.each do |row|
    split_name = row[0].split(" ")
    name = split_name[0] + " " + split_name[1]
    employee_email = split_name[2].gsub(/[)(]/, "")
    result = verify( employee_email, "email" )
      if result == true
      db_connection{|connect| connect.exec_params("INSERT INTO employees (employee_name, email) VALUES ($1, $2)", [ name, employee_email ]) }
    end
  end
end




def customers_upload file
convert = []
  CSV.foreach(file) do |row|
    convert << row
  end
  convert.each do |row|
    split_customer = row[1].split(" ")
    name = split_customer[0]
    account = split_customer[1].gsub(/[)(]/, "")
      if verify( account, "customer_account_number", "customers" )
      db_connection{|connect| connect.exec_params("INSERT INTO customers (customer, customer_account_number) VALUES ($1, $2)", [ name, account ]) }
    end
  end
 end

 def products_upload file
 convert = []
   CSV.foreach(file) do |row|
     convert << row
   end
   convert.each do |row|
     product = row[2]
       if verify( product, "product", "products" )
       db_connection{|connect| connect.exec_params("INSERT INTO products (product) VALUES ($1)", [ product ]) }
     end
   end
  end

  def invoice_upload file
  convert = []
    CSV.foreach(file) do |row|
      convert << row
    end
    convert.each do |row|
      split_name = row[0].split(" ")
      employee = split_name[0] + " " + split_name[1]
      found_employee_key = empid employee

      split_customer = row[1].split(" ")
      customer = split_customer[0]
      found_customer_key = custid customer

      product = row[2]
      found_product_key = prodid product

      money = row[4].gsub(/[$]/, "")


        db_connection{|connect| connect.exec_params("INSERT INTO invoice (employee_id, customer_id, product_id, invoice_number, sale_date, sale_amount, units_sold, frequency) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)", [ found_employee_key, found_customer_key, found_product_key, "#{row[6]}","#{row[3]}", money, "#{row[5]}", "#{row[7]}"]) }
      end
  end
invoice_upload "sales.csv"
