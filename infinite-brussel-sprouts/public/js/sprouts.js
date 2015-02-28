// YOUR CODE GOES HERE
$(document).ready(function() {}); //system check to make sure everything is done before loading

var page = 1;
$(window).scroll(function() {
  if($(window).scrollTop() + $(window).height() == $(document).height()) {
//$(".more-sprouts").on("click", function(event) {
   //to pause the function
  page++;
  $.get("/tweets.json?page=" + page, function(newTweets) {//?page= is how you pass a params
      newTweets.forEach (function(value) {//because the json was a hash within an array we need to take each hash out to itterate to the codes below
        $(".tweets").append(//don't always need to pick the id's choose the class and insert it to include the styling
            "<li class='tweet'>" +
            "<div class='body'>" + value.text + "</div>" +
            "<div class='user'>" + value.username + "</div></li>");//append and add the block of code
          });
        });
      }
  });
