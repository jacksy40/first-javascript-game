require "sinatra"
require "pg"
require 'net/http'
require 'uri'

def db_connection
  begin
    connection = PG.connect(dbname: "grocery_list")
    yield(connection)
  ensure
    connection.close
  end
end

post "/create_list" do
  buy = params["buy"]
  db_connection{|connect| connect.exec_params( "INSERT INTO groceries (shopping_item) VALUES ($1)", [buy] )}
    redirect "/groceries"
end


get "/groceries" do
  list = db_connection{ |connect| connect.exec("SELECT * FROM groceries") }

  erb :index, locals: {items: list}
end
