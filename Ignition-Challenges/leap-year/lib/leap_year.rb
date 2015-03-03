def leap_year num
  # YOUR CODE HERE
  a = num.to_i
  if a % 100 == 0 && a % 400 != 0
    puts a.to_s + ' is not a leap year.'
  elsif a % 4 == 0 || a % 400 == 0
    puts a.to_s + ' is a leap year!'
  else
    puts a.to_s + ' is not a leap year.'
  end
end


puts (' I\'m here to pick out all the leap years.'.center(60))
puts 'First, give me a year to start?'
while true
num = gets.chomp
  if num == ''
  break
  else
  puts leap_year num
  end
end
