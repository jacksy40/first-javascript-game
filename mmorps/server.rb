require "sinatra"


use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get "/winner" do
  erb :winner, locals: {win: WIN}
end

get "/" do
  redirect "/RPS"
end

get "/RPS" do
  session[:player_win] = 0
  session[:comp_win] = 0
  choice = ""
  erb :index, locals: { choice: choice }
end

post "/choice" do
messages = ["It's a tie. Choose again!", "Player scores.", "Computer scores"]
comp = ["rock", "paper", "scissors"].sample
result = game(params[:choice], comp)
choice = messages[result]
  if session[:player_win].nil?
    player_win = 0
  else
    player_win = session[:player_win].to_i
  end
  if session[:comp_win].nil?
    comp_win = 0
  else
    comp_win = session[:comp_win].to_i
  end
  if result == 1
   session[:player_win] = player_win + 1
  else result == 2
   session[:comp_win] = comp_win + 1
  end
player_score = session[:player_win]
comp_score = session[:comp_win]
if player_score > 2
  WIN = "The Human won!"
  redirect "/winner"
  elsif comp_score > 2
    WIN = "The Computer won!"
    redirect "/winner"
end
erb :game, locals: { choice: choice, computer_score: comp_score, player_score: player_score, computer: comp, player: params[:choice] }
end

def game (player, comp)
  comp_loses = {'scissors'=>'rock', 'rock'=>'paper', 'paper'=>'scissors'}
  if comp == player
    return 0
   elsif player == comp_loses[comp]
    return 1
  else
    return 2
  end
end
