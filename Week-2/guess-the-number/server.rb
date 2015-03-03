require "sinatra"


post "/create_list" do
  params["buy"]

  File.open("grocery_list.txt", "a") do |file|
    file.puts params["buy"]
  end
  redirect "/groceries"
end

get "/groceries" do
  avoid = File.read("food_to_avoid.txt")
  items = File.readlines("grocery_list.txt")

  say_no = " - this is on the avoid list!"
  erb :index, locals: {items: items, avoid: avoid, say_no: say_no}
end
