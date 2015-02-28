require 'sinatra'
require 'json'
require 'sinatra/json'

configure do
  set :public_folder, 'public'
end

get "/" do
  erb :index, locals: { dish: random_dishes }
end

get "/new-dishes.json" do
  content_type :json

  { dishes: random_dishes }.to_json
end

def random_dishes
  dishes = [
  "Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

  dishes.sample
end

dishes = [
"Roasted Brussels Sprouts",
"Fresh Brussels Sprouts Soup",
"Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
"Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
"Hot Cheesy Roasted Brussels Sprout Dip",
"Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
"Roasted Brussels Sprout and Red Potato Salad",
"Smoky Buttered Brussels Sprouts",
"Sweet and Spicy Roasted Brussels Sprouts",
"Smoky Buttered Brussels Sprouts",
"Brussels Sprouts and Egg Salad with Hazelnuts"]
