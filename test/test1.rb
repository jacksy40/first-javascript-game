puts "Hi, what's your name?"
name=gets.chomp
puts"Hi " + name + ", how are you? I am the computer and my name is Mac"
puts "do you know any good stories?"
huh=gets.chomp.downcase
if huh=="yes"
  puts "can you tell me."
else
  puts "thats ok, maybe next time."
end

answer = 0
puts "What is 2 + 2 ?"
answer=gets.chomp
until answer == "4"
  puts " try again"
answer=gets.chomp
end
puts " good job!"
