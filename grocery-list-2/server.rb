require "sinatra"
require "pg"

def db_connection
  begin
    connection = PG.connect(dbname: "grocery_list")
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  list = db_connection{ |connect| connect.exec("SELECT * FROM groceries") }

  erb :index, locals: {items: list}
end

get "/delete" do
  key = params[:key]
  db_connection{ |connect| connect.exec_params( "delete from groceries where key_id=($1)", [key]) }
  redirect "/groceries"
end

post "/create_list" do
  buy = params["buy"]
  db_connection{ |connect| connect.exec_params( "INSERT INTO groceries (shopping_item) VALUES ($1)", [buy] ) }
    redirect "/groceries"
end
