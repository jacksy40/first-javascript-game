function randomInt(){
  return Math.floor(Math.random() * 100);
}
var randomNumber = "";

$("#start").on("click", function(event) {
  event.preventDefault();
  $("#player_guess").show();
  $("#start").hide();
  return randomNumber = randomInt();
});

$("#restart").on("click", function(event) {
  $("#start").on("click", function(event) {
    event.preventDefault();
    $("#player_guess").show();
    $("#start").hide();
    return randomNumber = randomInt();
  })
});

  $("#player_guess").on("submit", function(event) {
    event.preventDefault();
    $("#player_guess").show();
  var tip = validateGuess($("#guess").val(), randomNumber);

  if ($("#guess").val() == randomNumber) {
    $("#tips").append("<ol class='error'>"+ $("#guess").val() +" "+ tip + "</ol>");
    $("#tips").append("<ol><a id='restart' href=\"\">restart</a></ol>");
  } else {
  $("#tips").append("<ol class='errors'>"+ $("#guess").val()+" " + tip + "</ol>");
  }
});

  function validateGuess(guess, randomNum) {
    var tips = [];
    if (guess / 1 != guess) {
      tips.push("please use numbers!")
    } else if (guess > 100) {
      tips.push("please don't go below 1 and above 100.")
    } else if(guess > randomNum) {
      tips.push("guess was to high.")
    } else if (guess < randomNum) {
      tips.push("guess was to low.")
    } else if (guess == randomNum) {
      tips.push("You got it!")
    }

    return tips;
  }
