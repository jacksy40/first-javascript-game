#Write Ruby<->English answers here as comments in your code

array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
sum = 0
array.each{|a| sum=sum+a}
puts sum

# * How would you print out each value of the array?
array.each {|a| puts "#{a}"}

# * What is the sum of all of the even numbers?

even=array.select(&:even?).reduce(:+)
puts even

# * What is the sum of all of the odd numbers?
odd=array.select(&:odd?).reduce(:+)
puts odd

# * What is the sum of all the numbers divisble by 5?
div=array.find_all{|a| a%5==0}.reduce(:+)
puts div

# * What is the sum of the squares of all the numbers in the array?

sum=0
array.each do |a|
  power=a**2
  sum+=power
end
puts sum

array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari", "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo", "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

#  Write Ruby code to find out the answers to the following questions:

# * How would you print put each name backwards in `array`?

array.each{|a| puts a.reverse}

# * What are the total number of characters in the names in `array`?
total=array.each{|a|}.reduce(:+).length
puts total

# * How many names in `array` are less than 5 characters long?
puts array.select.count{|a| a.length<5}
# * How many names in `array` end in a vowel?
puts array.each.count{|a| a[-1] =~/[aeiou]/}
# * How many names in `array` are more than 5 characters long?
puts array.select.count{|a| a.length>5}
# * How many names in `array` are exactly 5 characters in length?
puts array.select.count{|a| a.length==5}

best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

#  Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of the artists?
puts best_records.keys
# * How would you print out all the names of the albums?
puts best_records.values
# * Which artist has the longest name?

puts best_records.max_by{|name,_| name}

# * How would you change all the album titles for every artist to `Greatest Hits`?
best_records.each{|k,_|best_records[k]="Greatist Hits"}
# * How would you delete a key-value pair if the artist's name ends in a vowel?
puts best_records.delete_if{|name,_| name[-1] =~/[aeiou]/}

ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `ages`?
puts ages.keys
# * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
ages.each{|name,age| puts "#{name} is #{age} years old."}

# * How would you print out every person with odd numbered age?
puts ages.select{|k,v| v%2==1}

# * How would you delete everyone under 25 years of age?
ages.delete_if{|k,v| v<25}

# * What is the name and age of everyone with a name greater than or equal to 5 characters?
puts ages.select{|k,v| k.length>=5}

people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
      "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
        "company" => "Heidenreich, Nietzsche and Dickinson"

      }

}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `people`?

puts people.keys


# * How would you print out all the names of `people` and which company they work for?

people.each do |k,v|
  company=v.fetch("company")
  puts "#{k} works for #{company}."
end

# * What are the names of all the children of everyone in `people`?
people.each do |k,v|
  v.select{|key,value| key=="children"}.each do |ch,child|
  no=child.count
    if no > 1
      puts "#{k}\'s children are"
    else
      puts "#{k}\'s child is"
    end
    puts child
  end
end

# * What are the names of all the companies that people work for?
people.each do |k,v|
  puts people[k]["company"]
end
# * How would you convert all the phone numbers to the same standard (pick one)?
people.each do |k,v|
  string=people[k]["phone"].to_s
  if string[0]=="1"
    string=string.sub("1","")
  else
  end
  format=string.gsub(/[\s+.)(-]/,"").insert(3,".").insert(7,".")
  people[k]["phone"]=format
end


people =
[
    {
          "Derek Wehner" => {
               "phone" => "588-047-7782",
             "company" => "Daniel-Carroll",
            "children" => [
                "Phoebe",
                "Gretchen",
                "Wiley"
            ]
        },
           "Ali Koelpin" => {
               "phone" => "1-127-057-0020",
             "company" => "Rau, Rutherford and Lockman",
            "children" => [
                "Juwan"
            ]
        },
        "Ervin Prohaska" => {
               "phone" => "(393) 630-3354",
             "company" => "Carter Inc",
            "children" => [
                "Virgil",
                "Piper",
                "Josianne"
            ]
        },
          "Hellen Borer" => {
              "phone" => "1-687-825-0947",
            "company" => "Maggio, Ferry and Moen"
        }
    },
    {
        "Elinor Johnson" => {
              "phone" => "819.911.5553",
            "company" => "Pollich Group"
        }
    },
    {
        "Richmond Murray" => {
               "phone" => "1-516-432-2364",
             "company" => "Sporer and Sons",
            "children" => [
                "Kade",
                "Sage"
            ]
        },
            "Nakia Ferry" => {
               "phone" => "134-079-2237",
             "company" => "Hamill, O'Keefe and Lehner",
            "children" => [
                "Rollin"
            ]
        }
    }
]

# Write Ruby code to find out the answers to the following questions:

# * What are the names of everyone in `people`?
people.each do |a|
  puts a.keys
end

# * What are the names of all the children in `people`?
people.each do |names|
  names.each do |name,children|
  names[name]["children"]
end
end
# * How would you create a new hash called `phone_numbers` that has a key of a
# name and value of a phone number in `people`?
people <<{"phone_numbers"=>{"joe"=>"617.889.1111"}}


# * How would you create a new hash called `employers` that has a key of a name
#and a value of a company name in `people`?

people <<{"employers"=>{"Macklemore"=>"Goodwill"}}

# * How would you create a new hash called `children_count` that has a key of a
#name and a value of the number of children a person has?

people <<{"children_count"=>{"Rollin"=>"843-556-2233"}}
