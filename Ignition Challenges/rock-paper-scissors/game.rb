# YOUR CODE GOES HERE
@comp_win = 0; @player_win = 0
def game (player, comp)

  comp_loses = {'scissors'=>'rock', 'rock'=>'paper', 'paper'=>'scissors'}
  if comp == player
    puts 'It\'s a tie! Choose again.'
  elsif player == comp_loses[comp]
    puts "#{player.capitalize} beats #{comp}, player wins round."
    @player_win+= 1
  else
    puts "#{comp.capitalize} beats #{player}, computer wins round."
    @comp_win += 1
  end
end

puts 'lets play.'
until (@comp_win==2 || @player_win==2)
  comp = ["rock", "paper", "scissors"].sample
  choice = ''
  until (choice == 'r' || choice == 'p' || choice == 's')
    puts 'Please use (r) for Rock, (p) for Paper, and (s) for scissors'
    choice = gets.chomp.downcase
  end
puts "Players score: #{@player_win}  Computer score: #{@comp_win}"
puts 'rock, paper, scissors, shoot...'
puts "Computer chose- #{comp.capitalize}"
  if choice == 'r'
    player = 'rock'
  elsif choice == 'p'
    player = 'paper'
  elsif choice == 's'
    player = 'scissors'
  end
puts "Player chose-  #{player.capitalize}"
game player, comp

end
if @comp_win == 2; puts 'Computer Wins!'else'Player Wins!'
end