class RPS
  def initialize( player_1 = nil, winner = false, win_streak = 0, game_start = true, play_again = false, high_score = 0 )
	    @line_width = 80
	    @win_streak = win_streak
	    @high_score = high_score
    @player_1   = player_1
	    @winner = winner
	    @play_again = play_again
	    @player_move; @computer_move; @moves = %w{r p s}
	    @player_score = 0; @computer_score = 0; @total_wins =
      	    @round = 1

	    @winner_found = false

	    introduction( game_start )

	    player_move
	 end

	  def introduction( game_start )
	    if game_start == true
	      puts "Optimal terminal view: 80 columns, 25 rows".rjust(@line_width)
	      puts "\n" * 18
	      puts "-" * 80
	      puts "Let's play Rock, Paper, Scissors!!".center(@line_width)
	      puts "We'll play a series of best out of 3".center(@line_width)
	      puts "First, what is your name, young champion?".center(@line_width)
	      puts "-" * 80
	    end

	    @player_1 = @player_1 ? @player_1 : gets.chomp.capitalize

	    @player_1 = "Blue" if @player_1.empty?

	    puts "\n" * 5
	    puts "-" * 80

	    if @winner == false
	      if @win_streak == 0
	        if @play_again == false
	          puts "Good luck #{@player_1}, our reigning champion Red is waiting for you in the arena.".center(@line_width)
	        else
	          puts "Red: Back for more #{@player_1}? You don't stand a chance!".center(@line_width)
	        end
	      else
	        puts "Our champion Red is ready to defend his title. Good luck, #{@player_1}!".center(@line_width)
	      end
	    elsif @winner == true
	      puts "Red wants to re-claim his throne. Are you ready to defend your title, #{@player_1}?".center(@line_width)
	    end

	    puts "On shoot, ready?".center(@line_width)
	    puts "Rock, paper, scissors, shoot.".center(@line_width)
	    puts "-" * 80
	  end

	  def score_checker
	    @total_wins = @player_score + @computer_score

	    #closing statements of game
	    if @win_streak == 0
	      @player_win = "Congratulations! You are our new champion, #{@player_1}!".center(@line_width)
	      @computer_win = "I really had faith in you kid, Red is still our reigning champion.".center(@line_width)
	      puts "\n"
	    elsif @win_streak > 0
	      @player_win = "Congratulations, #{@player_1}! You're on a #{@win_streak + 1} game winning streak!".center(@line_width)
	      @computer_win = "Red just broke your #{@win_streak} game winning streak, I know you'll be back for more".center(@line_width)
	      puts "\n"
	    end


	    #check game status
	    case @total_wins
	    when 0
	      print "The game is still scoreless, who will take the lead?!".center(@line_width) unless @round == 1
	    when 1
	      if @player_score == 1
	        puts "#{@player_1}, just one win away! Don't lose focus now!".center(@line_width)
	      else
	        puts "#{@player_1}, you're on the brink of elimination. Pull it together!".center(@line_width)
	      end
	    when 2
	      if @player_score == 1
	        puts "Tie game! #{@player_1}, this is for all the marbles!!".center(@line_width)
	      elsif @player_score == 2
	        puts @player_win
	      else
	        puts @computer_win
	      end
	    when 3
	      if @player_score == 2
	        puts @player_win
	      else
	        puts @computer_win
	      end
	    end

	    puts "-" * 80 unless @round == 1

	    #game over
	    if @player_score == 2 || @computer_score == 2
	      @winner_found = true

	      play_again?
	    end
	  end

	  def scoreboard( game_over = false )
	    puts "\n" * 2 if @round == 1
	    puts "Round #{@round}".center(@line_width) unless @winner_found
	    puts "Fight!".center(@line_width) unless game_over
	    print "High Score: #{@high_score}".ljust(@line_width/2) + "Current Streak: #{@win_streak}".rjust(@line_width/2)
	    print "\n"

	    puts "*" * 80
	    puts "Scoreboard".center(@line_width)
	    print "#{@player_1}".center(@line_width/2)
	    print "Red".center(@line_width/2)
	    print "\n"
	    print "#{@player_score}".center(@line_width/2)
	    print "#{@computer_score}".center(@line_width/2)
	    print "\n"
	    puts "*" * 80
	    puts "\n"
	  end
	  def player_move
	    score_checker
	    scoreboard

	    puts "Press 'r' for rock, 'p' for paper, and 's' for scissors.".center(@line_width)
	    puts "\n"

	    @player_move = gets.chomp.downcase
	    puts "\n"

	    #recursion if invalid input
	    unless @moves.include?(@player_move)
	      puts "Remember young champion, type only 'r', 'p', or 's' (not including ' ')".center(@line_width)
	      player_move
	    end

	    computer_move
	  end

	  def computer_move
	    @computer_move = @moves[rand(0..2)]

	    action_view

	    rock     if @player_move == 'r'
	    paper    if @player_move == 'p'
	    scissors if @player_move == 's'
	  end

	  def outcome( result )
	    case result
	    when 'tie'
	      puts "Round #{@round} is a tie!".center(@line_width)
	    when 'win'
	      puts "Round #{@round} goes to #{@player_1}!".center(@line_width)
	      @player_score += 1
	    when 'loss'
	      puts "Round #{@round} goes to Red!".center(@line_width)
	      @computer_score += 1
	    end

	    @round += 1
	    player_move
	  end

	  def rock
	    puts "-" * 80
	    case @computer_move
	    when 'r'
	      outcome( 'tie' )
	    when 'p'
	      outcome( 'loss' )
	    when 's'
	      outcome( 'win' )
	    end
	  end

	  def paper
    puts "-" * 80
    case @computer_move
    when 'r'
      outcome( 'win' )
    when 'p'
      outcome( 'tie' )
    when 's'
      outcome( 'loss' )
    end
  end

  def scissors
    puts "-" * 80
    case @computer_move
    when 'r'
      outcome( 'loss' )
    when 'p'
      outcome( 'win' )
    when 's'
      outcome( 'tie' )
    end
  end

  def action_view( i = 0 )
    #original action view images
    # if move == 'r'
    #   print "  __^__^__\n"
    #   print " /  ~   ~ \\\n"
    #   print "<   * R *   >\n"
    #   print "|  \\_____/ |\n"
    #   print " \\________/\n"
    # elsif move == 'p'
    #   print "  _________\n"
    #   print " |  ^   ^  |\n"
    #   print " |    P    |\n"
    #   print " |  <--->  |\n"
    #   print " |_________|\n"
    # elsif move == 's'
    #   print " _\n"
    #   print "(_)     ____\n"
    #   print "   \\__/S=|===>\n"
    #   print " _/    \\____\n"
    #   print "(_)\n"
    # end

	    r = ["  __^__^__".center(@line_width/2), " /  ~   ~  \\".center(@line_width/2),
	         "<    * R *   >".center(@line_width/2), "|  \\_____/ |".center(@line_width/2),
	         " \\________/".center(@line_width/2)]
	    p = ["  _________".center(@line_width/2), " |  ^   ^  |".center(@line_width/2),
	         " |    P    |".center(@line_width/2), " |  <--->  |".center(@line_width/2),
         " |_________|".center(@line_width/2)]
    s = ["_".center(@line_width/2), "        (_)    ____".center(@line_width/2),
	         "           \\__/S=|===>".center(@line_width/2),
	         "         _/   \\____".center(@line_width/2), "(_)".center(@line_width/2)]

	    case @player_move
	    when 'r'
	      print r[i]
	    when 'p'
      print p[i]
	    when 's'
	      print s[i]
	    end

	    case @computer_move
	    when 'r'
	      print r[i]
	    when 'p'
	      print p[i]
	    when 's'
	      print s[i]
	    end

	    print "\n"
	    i += 1
	    action_view( i ) if i < 5
	  end


	  def play_again?( first_input = true )
	    winner = @player_score == 2 ? true : false

	    #increase win streak
    if first_input
      if winner
	        @win_streak += 1
	        @high_score = @win_streak if @win_streak > @high_score
	      else
        @win_streak = 0
      end
    end

    if first_input
	      puts "\n\n"
	      scoreboard( game_over = true )

	      puts "Do you want to play again? ('y'/'n')".center(@line_width) if first_input
	      puts "\n"
	    end

	    player_continue = gets.chomp.downcase

	    play_again?( first_input = false ) unless player_continue == 'y' || player_continue == 'n'

	    exit if player_continue == 'n'

	    new_game = RPS.new( @player_1, winner, @win_streak, game_start = false, play_again = true, @high_score )
	  end
	end
	new_game = RPS.new
