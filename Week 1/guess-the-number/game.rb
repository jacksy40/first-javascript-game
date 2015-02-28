# YOUR CODE GOES HERE
number_to_guess=rand(1000)
guess = 0
difference = 0
change = 0

puts "Lets play the guessing game.\n I'll pick a number and you try to guess what that munber is.\n To help, I\'ll tell you if you're closer or not."
#puts number_to_guess


puts"if you're ready? Lets start picking numbers!"
guess=gets.chomp.to_i
if (guess-number_to_guess).abs > 30
  puts "Good start but its kind of cold."
else
  puts "Great choice, you're getting warm!"
end
  while guess != number_to_guess
  difference = (guess - number_to_guess).abs
  guess=gets.chomp.to_i
  change = (guess - number_to_guess).abs
    if guess == number_to_guess
      break
    elsif change < difference
    puts "getting warmer"
    else
    puts "getting colder"
    end
  end
puts "You got it. Great game!"
