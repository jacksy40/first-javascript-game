number = rand(1001)
	input = nil

	until input == number
	  print "Guess a number between 1 and 1000: "
	  input = gets.chomp.to_i
	  if input < number
	    puts "Too low, try again."
	  elsif input > number
	    puts "Too high, try again."
	  end
	end
