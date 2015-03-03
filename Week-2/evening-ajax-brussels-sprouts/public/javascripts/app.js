$("#get_it").on("click", function() {
  $.get("/new-dishes.json", function(newDish){
    alert(newDish["dishes"]);
    $(".bruss").append("<li class='print'>Your dish is " + newDish.dishes + "</li>")
  });
});
