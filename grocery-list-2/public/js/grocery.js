var buy = "";

$("#condition").submit(function (event) {
  buy = $("#buy").val();
    if(buy === "") {
      event.preventDefault();
      alert("Please put an item in your list.");
    }else
    return true
    });
