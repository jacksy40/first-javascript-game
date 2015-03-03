# Use this file to import the sales information into the
# the database.
require "pg"
require "csv"
require 'pry'



def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

def read_file(filename)
  data_array = []
  CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
    data_array << row.to_hash
  end
  puts data_array
end

read_file "sales.csv"
