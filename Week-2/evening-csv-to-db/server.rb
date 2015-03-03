require "sinatra"
require "pg"

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

post "/create_list" do
  ingredient = params["ingredient"]
  db_connection do |conn|
    conn.exec_params("INSERT INTO brussel_sprouts (name) VALUES ($1)",[ingredient])
  end
  redirect "/yummybrussels.com"
end

get "/yummybrussels.com" do
  stuff = db_connection { |conn| conn.exec("SELECT name FROM brussel_sprouts") }

  erb :index, locals: {ingredients: stuff}
end
