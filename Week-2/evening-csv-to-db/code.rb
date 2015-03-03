#YOUR CODE GOES HERE
require "pg"
require "csv"

def db_connection
  begin
    connection = PG.connect(dbname: "news_aggregator_development")
    yield(connection)
  ensure
    connection.close
  end
end


def csv_migration file
convert = []
  CSV.foreach(file) do |row|
    convert << row
  end
  convert.each do |row|
    db_connection do |conn|
      conn.exec_params("INSERT INTO brussel_sprouts (name, numberid) VALUES ($1, $2)", [row[1]], [row[0]])
    end
  end
end


def update
ingredient = nil
puts "Migrate Ingredient.CSV to PSQL:"
  until ingredient == "/q"
    ingredient = gets.chomp
      if ingredient == "/q"
        break
      else
        db_connection do |conn|
          conn.exec_params("INSERT INTO posts (name) VALUES ($1)",[ingredient])#$ is placeholder 1 is the first element 2 is the second element
        end
      end
  end
  controller
end

def dl
puts "set table:"
to_delete = gets.chomp
  if to_delete =="/q"
    controller
  end
puts "specify header:"
header = gets.chomp
puts "specify record to delete:"
record = gets.chomp
  db_connection do |conn|
    conn.exec_params("delete from #{to_delete} where #{header} = '#{record}';")
  end
  controller
end


def output
 print_out = db_connection { |conn| conn.exec("SELECT * FROM posts") }
  print_out.each do |value|
    puts "#{value["id"]}--#{value["article"]}, #{value["url"]}, #{value["description"]}"
  end
  controller
end

def controller
puts "'csv_migration(filename)','update', 'output', or 'dl' to the database?"
puts "'/q' to exit."
process = gets.chomp
  if process == "/q"
    return
  end
send process
end

controller
