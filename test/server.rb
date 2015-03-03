require "sinatra"

use Rack::Session::Cookie, {
  secret: "change_me",
  expire_after: 86400 # seconds
}

get "/" do
  if session[:visit_count].nil?
    visit_count = 1
  else
    visit_count = session[:visit_count].to_i
  end
  session[:visit_count]=visit_count + 1
  post = "you've visited this page #{visit_count} times. \n"
  erb :index, locals: { post: post }
end
