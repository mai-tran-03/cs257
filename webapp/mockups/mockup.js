
// Set up the event listeners for the search bar after loading
window.addEventListener("load", function() {
    let searchElement = document.getElementById("search_bar");
    searchElement.addEventListener("keyup", filterResults); 

    searchElement.addEventListener("focusin", showSearchList);
    searchElement.addEventListener("focusout", hideSearchList);

});

function showSearchList() {
    let ul = document.getElementById("search_countries");
    ul.style.visibility = "visible";
}

function hideSearchList() {
    let ul = document.getElementById("search_countries");
    ul.style.visibility = "hidden";
}

// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp
function filterResults() {
    let input = document.getElementById("search_bar");
    let filter = input.value.toUpperCase();
    let ul = document.getElementById("search_countries");
    let li = ul.getElementsByTagName("li");
    for (let i = 0; i < li.length; i++) {
        let a = li[i].getElementsByTagName("a")[0];
        let txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}