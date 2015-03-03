require "sinatra"
require "pry"
get "/tasks" do
  tasks = File.readlines("tasks.txt")
  erb :index, locals: { tasks: tasks }
end

get "/loop/" do
  erb :hi
end

post "/tasks" do
  task = params["task_name"]
binding.pry
  File.open("tasks.txt","a") do |file|
    file.puts(task)
  end
  redirect "/tasks"
end
