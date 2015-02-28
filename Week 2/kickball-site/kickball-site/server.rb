require "sinatra"
require "json"

teams = File.read( "roster.json" )
teams = JSON.parse(teams)

positions = {}
teams["Simpson Slammers"].each_key { |position| positions[position] = [] }

teams.each_value do |lineup|
  positions.each_key { |position| positions[position] << lineup[position] }
end

get "/index" do
  erb :index, locals: { teams: teams, positions: positions }
end

get "/:team_name" do
  erb :show, locals: { teams: teams, team_name: params[:team_name] }
end

get "/place/:position" do
  erb :showpositions, locals: { positions: positions, position: params[:position] }
end
