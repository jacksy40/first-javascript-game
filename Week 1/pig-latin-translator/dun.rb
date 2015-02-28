def translate(sentence)
	  array = sentence.split(" ").to_a
	  array.each do |word|
	    if word =~ /\A[aeiou]/
	       word << "way"
	    else
	       cons = word.match(/\A[^aeiou]+/)
	       word.gsub!(/\A[^aeiou]+/, "")
	       word << "#{cons}ay"
	    end
	  end
	  puts array.join(" ")
	end
translate "which way did he go I and on my way"
