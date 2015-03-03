-- DEFINE YOUR DATABASE SCHEMA HERE
create table employees (
  employee_id serial primary key,
  empolyee_name varchar(100),
  email varchar(50)

);

create table customers (
  customer_id serial primary key,
  customer varchar(100),
  customer_account_number varchar(50)
);

create table products (
  product_id serial primary key,
  product varchar(50)
);

create table invoice (
  id serial primary key,
  employee_id int REFERENCES employees(employee_id) NOT NULL,
  customer_id int REFERENCES customers(customer_id) NOT NULL,
  product_id int REFERENCES products(product_id) NOT NULL,
  invoice_number int,
  sale_date date,
  sale_amount decimal,
  units_sold int,
  frequency varchar(50)
);
