# YOUR CODE GOES HERE
number_to_guess=rand(1000000001)
guess = 0

puts "Lets play the guessing game.\n I'll pick a number and you try to guess what that munber is.\n To help, I\'ll tell you if you're closer or not."
puts

puts"if you're ready? Lets start picking numbers!"
guess=gets.chomp.to_i

  while guess != number_to_guess
    if guess == number_to_guess
      break
    elsif guess < number_to_guess
    puts "too low, guess again."
    else
    puts "too high, guess again"
    end
  end
puts "You got it. Great game!"
