// Get the modal element
var modal = document.getElementById("shoppingListModal");

// Get the button that opens the modal
var btn = document.getElementById("generateShoppingList");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal
btn.onclick = function() {
  modal.style.display = "block";
  displayShoppingList();
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function displayShoppingList() {
  // Get the shopping list from local storage
  var shoppingList = JSON.parse(localStorage.getItem("shoppingList"));

  // Check if there is a shopping list in local storage
  if (shoppingList) {
    var list = document.getElementById("shopping-list");

    // Clear the existing shopping list
    list.innerHTML = "";

    // Loop through the shopping list items and add them to the list
    for (var i = 0; i < shoppingList.length; i++) {
      var item = document.createElement("li");
      item.innerHTML = shoppingList[i];
      list.appendChild(item);
    }
  } else {
    // Display a message if there is no shopping list in local storage
    document.getElementById("shopping-list").innerHTML = "No items in shopping list.";
  }
}
