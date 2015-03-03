# YOUR CODE GOES HERE
def format_text textfile
  reversed = {}
  strip_file = Hash.new(0)
  normalize_file = File.read(textfile).downcase.gsub(/|W+/,'')
  words = normalize_file.split
  words.each do |word|
    strip_file[word] += 1
  end
   reversed =strip_file.sort_by {|word,freq| freq}.reverse
  reversed.each do |k,v|
    savenow = (k.length * v)-(2*v)
    cost = (k.length * v)
    cost += cost
    save += save
    puts "cost: #{k.length * v} could save: #{savenow} word: #{k} Freq: #{v}"
    puts "total cost: #{cost} total save: #{save} net: #{cost - save}"
  end
end

filename = gets.chomp
format_text filename
