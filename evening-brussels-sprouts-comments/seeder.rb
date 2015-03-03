require 'pg'
require 'faker'

TITLES = ["Roasted Brussels Sprouts",
  "Fresh Brussels Sprouts Soup",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoky Buttered Brussels Sprouts",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]

FOREIGN_ID = [1,3,2,1,1,4,5,6,7,8,9,6,9,6,4,10,11,11,1,4,5]

COMMENTS = ["they were awesome",
  "Freshest and the best Brussels Sprouts Soup ever!",
  "love the Parmesan, and Lemon",
  "I don't like the Broccoli with Dried Cherries with my Sprouts",
  "Hot Cheesy Roasted Brussels Sprout Dip is to die for!",
  "Pomegranate Roasted Brussels stinks",
  "Roasted Brussels Sprout and Red Potato Salad is amazballs",
  "Smoky Buttered Brussels Sprouts is heavenly",
  "Sweet and Spicy Roasted Brussels Sprouts is too spicy",
  "always had Smoky Buttered Brussels Sprouts",
  "I am not alergic to Brussels Sprouts and Egg Salad with Hazelnuts"]

#WRITE CODE TO SEED YOUR DATABASE AND TABLES HERE

def db_connection
  begin
    connection = PG.connect(dbname: "brusssels_sprouts_recipes")
      yield(connection)
  ensure
    connection.close
  end
end

# db_connection do |conn|
#   TITLES.each do |dish|
#     conn.exec_params("INSERT INTO recipes (dishes) VALUES ($1)",[dish])
#   end
# end

# db_connection do |conn|
#   COMMENTS.each do |comment|
#     conn.exec_params("INSERT INTO comments (comments) VALUES ($1)",[comment])
#   end
# end
num = 0
db_connection do |conn|
  FOREIGN_ID.each do |id|
    conn.exec_params("DELETE comments SET dish_id=id where id=4")
  end
end

db connection do |conn|
5.times do
  rand_comment = Faker::Lorem.sentence
  rand_id=(1..11).to_a.sample
  conn.exec_params("INSERT INTO comments (comments, rand_it) VALUES ($1)",[rand_comment, rand_id])
  end
end

cant_recipes = db_connection do |conn|
  conn.exec("select count(id) from comments;")

SELECT recipes.name,COUNT(*) from comments comments WHERE comments.recipe_id =re.id)FROM recipes re;

GROUPBY
EXPLAIN ANALYZE WILL TIME IT


select recipes.name FROM comments, recipes WHERE comments.id = 1 and recipe_id = recipes.id;
