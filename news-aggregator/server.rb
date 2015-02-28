require "sinatra"
require "csv"
require 'net/http'
require 'uri'


def ping(host)
begin
 url=URI.parse(host)
 response=Net::HTTP.get(url)
   if response==""
     return false
   else
     return true
   end
   rescue Errno::ECONNREFUSED
     return false
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
    ping_url = params["url"]
  #response = ping("http://#{params["url"]}")
  if params["url"] != ""
  ping"http://#{ping_url}"
  end
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
  elsif response == true
    error = "input a good URL"
    redirect "/error"
  else
    article = params["article"]
    url = params["url"]
    des = params["des"]
    CSV.open("slack.csv","a+") do |csv|
      csv << [article, url, des]
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
  CSV.foreach('slack.csv', headers: true, header_converters: :symbol) do |row|
    slacks << row.to_hash
  end
  erb :articles, locals: {slacks: slacks}
end

require 'net/http'
require 'uri'


def ping(host)
begin
 url=URI.parse(host)
 response=Net::HTTP.get(url)
   if response==""
     return false
   else
     return true
   end
   rescue Errno::ECONNREFUSED
     return false
 end
end
