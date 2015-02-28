# YOUR CODE HERE
def format_text textfile
  top_ten = []
  content = []
  stop_word = []
  text = nil
  strip_file = Hash.new(0)
  file = File.open( "#{textfile}", 'r' ){|f| f.read.split}
  stopw = File.open( 'stop_words.txt', 'r'){|f| f.read}
      stop_word  = [stopw]
  file.each do |s|
    format = s.downcase.gsub(/[^'a-z0-9\s]/, ' ')
    content << format
  end
  text = content.join(" ")
  text.split.each do |words|
    strip_file[words] += 1
  end
  stop_text = stop_word.join(" ")
  #stop_text.split.each{|z| strip_file.delete z }
  top_ten = [strip_file.sort_by {|word,freq| freq}.reverse[0..19]]
  top_ten.each do |a|
    a.each do |k,v|
      puts " #{k} shows up #{v} times."
    end
  end
end

filename = gets.chomp
format_text filename
