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

response = nil
error = nil
articlee = nil
urle = nil
dese = nil
slacks = []
#error conditions
post "/test" do

  if params["article"] == "" || params["url"] =="" || params["des"] == ""
    error = "Error, Please don't leave any fields blank."
    articlee = params["article"]
    urle = params["url"]
    dese = params["des"]
    redirect "/error"
  elsif params["des"].length.to_i < 20
    error = "Don't slack off here. Write a little more in the description!"
    articlee = params["article"]
    urle = params["url"]
    dese = params["des"]
    redirect "/error"
  else
    article = params["article"]
    url = params["url"]
    des = params["des"]
    csv.
  end
    redirect "/"
  end
end
#controller

get "/" do
  clear_error = nil
  article = params["article"]
  url = params["url"]
  des = params["des"]
  erb :index, locals:{error: clear_error, art: article, ur: url, descript: des}
end

get "/error" do
  erb :index, locals:{error: error, art: articlee, ur: urle, descript: dese }
end

get "/articles" do
  stuff = CSV.readline("slacks.csv")  erb :articles, locals: {slacks: stuff}
end
