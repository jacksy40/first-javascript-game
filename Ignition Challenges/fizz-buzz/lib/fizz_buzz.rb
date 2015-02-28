# YOUR CODE HERE
1.upto(100) do |a|
  if a % 3 == 0 and a % 5 == 0
    puts 'fizzbuzz'
  elsif a % 5 == 0
    puts 'buzz'
  elsif a % 3 == 0
    puts 'fizz'
  else puts a
  end
end
