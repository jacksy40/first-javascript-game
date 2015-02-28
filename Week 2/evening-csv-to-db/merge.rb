require "pg"
require "csv"

CSVFILE = "ingredients.csv"

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end

def csv_migration file
convert = []
  CSV.foreach(file) do |row|
    convert << row
  end
  convert.each do |row|
    db_connection do |conn|
      conn.exec_params("INSERT INTO brussel_sprouts (name, numberid) VALUES (\'#{row[1]}\', #{row[0]});")
    end
  end
end
csv_migration CSVFILE
