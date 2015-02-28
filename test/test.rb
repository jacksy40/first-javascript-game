puts {a"bee"}.class
puts ["f"].class

def say_hello(name)
  puts "Hello, #{name}."
end
name="jim"
say_hello name

def introduction (age, gender, *names)
  puts "Hi, this is #{names.join(" ")}. I am #{age} and #{gender}."
end
names = ["joe", "James", "Jane"]
age = 23
gender = "male"
introduction age, gender, *names

def add(*numbers)
  puts numbers.inject(0) { |sum, number| sum + number }
end

def subtract(*numbers)
  current_result = numbers.shift
  puts numbers.inject(current_result) { |current_result, number| current_result - number }
end
system "clear"

def calculate(*arguments)
  # if the last argument is a Hash, extract it
  # otherwise create an empty Hash
  options = arguments[-1].is_a?(Hash) ? arguments.pop : {}
  options[:add] = true if options.empty?
  return add(*arguments) if options[:add]
  return subtract(*arguments) if options[:subtract]
end



def time(a_proc)
  start = Time.now
  a_proc.call
  puts Time.now - start
end

time(Proc.new{
   1000.times { 5 + 5 }
  }
)
