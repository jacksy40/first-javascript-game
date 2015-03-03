require "pry"
file_name = ARGV[0]
num_words = ARGV[1]
if file_name.nil? || num_words.nil?
  raise "you need a file"
end

 normalize_file = File.read(file_name).downcase.gsub(/[^'a-z0-9\s]/,'')
 words = normalize_file.split
stop_words = File.read(stop_word.text).split("/n")
 counted_words = {}

 words.each do |word|
   next if stop_words.include?(word)
   counted_words[word] ||= 0 #memoization caching variable dog = dog || "spot"
   counted_words[word] += 1
 end
 sorted_words = counted_words.sort_by {|k,v| v}
 top_words = sorted_words.last(num_word.to_i).reverse
tops_words.each do |key,value|
  puts "#{key} : #{value}"
end
