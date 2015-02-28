# YOUR CODE HERE
def right_most(phrase, letter)
  phrase = phrase.downcase
  if phrase == ''
    nil
  elsif phrase.include? letter
    rev_phrase = (/#{letter}/ =~ phrase.reverse!);
    length_phrase = phrase.length - 1
    last_letter = length_phrase.to_i - rev_phrase.to_i
    puts "Rightmost index is #{last_letter}"
  else
    nil
  end
end

puts 'Please enter a phrase'; phrase = gets.chomp
puts 'Now give me a letter and I will return the right most accurrence'; letter = gets.chomp
right_most phrase, letter
