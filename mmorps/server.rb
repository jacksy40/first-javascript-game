require "sinatra"
require "pry"

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get "/" do
  redirect "/RPS"
end
get "/RPS" do
  session[:player_win] = 0
  session[:comp_win] = 0
erb :game
end

get "/game" do
  @message = session[:message]
  @player_score = session[:player_win]
  @computer_score = session[:comp_win]
  erb :game
end

get "/winner" do
  @message = session[:message]
  @player_score = session[:player_win]
  @computer_score = session[:comp_win]
  erb :winner
end

post "/choice" do
@computer_choose = ["rock", "paper", "scissors"].sample
@player_choose = params[:choice]
result = game(@player_choose, @computer_choose)
  if result == 1
    session[:message] = "Player chooses #{@player_choose}, and Computer chooses #{@computer_choose}. Player scores."
    session[:player_win] += 1
    elsif result == 2
      @message = session[:message] = "Player chooses #{@player_choose}, and Computer chooses #{@computer_choose}. Computer scores."
      session[:comp_win] += 1
    else
      session[:message] = "It's a tie! Choose again."
  end
  if session[:player_win] > 2 || session[:comp_win] > 2
    if session[:player_win] > 2
      session[:message] = "Player chose #{@player_choose}, and Computer chose #{@computer_choose}. Human Wins!"
    redirect "/winner"
    else
      session[:message] = "Player chose #{@player_choose}, and Computer chose #{@computer_choose}. Computer Wins!"
      redirect "/winner"
    end
  else
    redirect "/game"
  end
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
