#puts " type in a sentence to translate"
#input = gets.chomp.downcase
def translate input
pig=[]
input.split.each do |word|
  if word[0] !~ /[aeiou]/
    word.each_char do |c|
      if c !~ /[aeiou]/
        word = word.sub(c,"")
        word = word.insert(-1,c)
      else
        word.insert(-1,"ay")
        break
      end
    end
  else word[0] =~ /[aeiou]/
    word.insert(-1,"way")
  end
pig << word
end
return pig.join(" ")
end

#translate input
