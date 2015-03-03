require "sinatra"
require "csv"
require 'net/http'
require 'uri'
require "pg"
require "pry"

def db_connection
  begin
    connection = PG.connect(dbname: "news_aggregator_development")
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
      conn.exec_params("INSERT INTO posts (article, url, description) VALUES ($1,$2,$3)", [row[0], row[1], row[2]])
    end
  end
end


error = nil
article = nil
url = nil
des = nil
#error conditions
post "/test" do
article = params["article"]
url = params["url"]
des = params["des"]
  if params["article"] == "" || params["url"] =="" || params["des"] == ""
    error = "Error, Please don't leave any fields blank."
    redirect "/error"
    elsif params["des"].length.to_i < 20
      error = "Don't slack off here. Write a little more in the description!"
      redirect "/error"
  else
    db_connection do |conn|
    conn.exec_params("INSERT INTO posts (article, url, description) VALUES ($1, $2, $3)",[article,url,des])
  end
    redirect "/slacks.com"
  end
end
#controller

get "/migration" do
  erb :migration
end

post "/migrate" do
  csv_migration params["file"]
  redirect "/"
end

get "/slacks.com" do
  clear_error = nil

  erb :index, locals:{error: clear_error, art: article, ur: url, descript: des}
end

get "/error" do
  erb :index, locals:{error: error, art: article, ur: url, descript: des }
end

get "/articles" do
  stuff = db_connection { |conn| conn.exec("SELECT * FROM posts") }
  erb :articles, locals: {slacks: stuff}
end
