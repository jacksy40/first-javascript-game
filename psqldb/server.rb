require "sinatra"
require "pg"

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end


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
