<!DOCTYPE html>
<html>
<body>

<p>Click the button to add a new element to the array.</p>

<button onclick="myFunction()">Try it</button>

<p id="demo"></p>

<script>
var fruits = ["Banana", "Orange", "Apple", "Mango"];
document.getElementById("demo").innerHTML = fruits;

function myFunction() {
    fruits.push("Kiwi");
    document.getElementById("demo").innerHTML = fruits;
}
</script>

</body>
</html>