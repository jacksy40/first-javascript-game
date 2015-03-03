transactions = [50_000, -2_000, -25_000, 4_000, -12_000, 5_000, -800, -900, 43_000, -30_000, 15_000, 62_000, -50_000, 42_000]

# Write Ruby code to find out the answers to the following questions:

# * What is the value of the first transaction?
puts transactions.first
# * What is the value of the second transaction?
puts transactions[1]
# * What is the value of the fourth transaction?
puts transactions[3]
# * What is the value of the last transaction?
puts transactions.last
# * What is the value of the second from last transaction?
puts transactions[-2]
# * What is the value of the 5th from last transaction?
puts transactions[-5]
# * What is the value of the transaction with index 5?
puts transactions[5]
# * How many transactions are there in total?
puts transactions.count
# * How many positive transactions are there in total?
puts transactions.count{|t|t>0}
# * How many negative transactions are there in total?
puts transactions.count{|t|t<0}
# * What is the largest withdrawal?
puts transactions.sort.first
# * What is the largest dposit?
puts transactions.sort.last
# * What is the small withdrawal?
puts transactions.select{|t|t<0}.sort.last
# * What is the smallest deposit?
puts transactions.select{|t|t>0}.sort.first
# * What is the total value of all the transactions?
@total = 0
transactions.each {|t| @total+=t}
puts @total

# * If Dr. Dre's initial balance was $239,900 in this account, what is the value of his balance after his last transaction?
inital_bal = 239900
@total = 0
transactions.each {|t| @total+= t}
puts inital_bal + @total

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

# Write Ruby code to find out the answers to the following questions:

# * How many records are in `best_records`?
puts best_records.size

# * Who are all the artists listed?
puts best_records.keys
# * What are all the album names in the hash?
puts best_records.values
# * Delete the `Eminem` key-value pair from the list.
best_records.delete("Eminem")
# * Add your favorite musician and their best album to the list.
best_records[:"Kid Rock"]="The history of Rock"
# * Change `Nirvana`'s album to another.
best_records[:Nirvana]="Bleach"
# * Is `Nirvana` included in `best_records`?
puts best_records.include?("Nirvana")
# * Is `Soundgarden` included in `best_records`?
puts best_records.include?("Soundgarden")
# * If `Soundgarden` is not in `best_records` then add a key-value pair for the band.
best_records[:Soundgarden]="King Animal"
# * Which key-value pairs have a key that has a length less than or equal to 6 characters?
puts best_records.select {|k,v| k.length<=6}
# * Which key-value pairs have a value that is greater than 10 character?
puts best_records.select {|k,v| k.length>10}
