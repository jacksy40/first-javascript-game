# YOUR CODE HERE
require 'pry'
a = 99
while a > 0
  if a % 10 == 0
    puts a.to_s + ' bottles of beer on the wall, ' + a.to_s + ' bottles of beer!'
    puts 'Take one down and pass it around, ' +(a - 1).to_s + ' bottles of beer on the wall.'
    puts
    binding.pry
  elsif a == 1
    puts '1 bottle of beer on the wall, 1 bottle of beer.'
    puts 'Take one down and pass it around, no more bottles of beer on the wall.'
    puts
    puts 'No more bottles of beer on the wall, no bottles of beer!'
    puts 'Go to the store and buy some more, 99 bottles of beer on the wall'
  else
    puts a.to_s + ' bottles of beer on the wall, ' + a.to_s + ' bottles of beer.'
    puts 'Take one down and pass it around, ' +(a - 1).to_s + ' bottles of beer on the wall.'
    puts
  end
a = a -1
end
