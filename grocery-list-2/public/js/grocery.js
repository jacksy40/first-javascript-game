$("#condition").submit(function (event) {
    if($("#buy").val() === "") {
      alert("Please put an item in your list.");
      return false
    }else
    return true
    });
