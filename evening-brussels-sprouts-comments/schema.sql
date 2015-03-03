create table recipes (
  dish_id serial primary key,
  dishes varchar(100)


);

reate table comments (
  id serial primary key,
  comments varchar(100),
  dish_id int REFERENCES recipes(dish_id) NOT NULL (can't have id without an id)
);
