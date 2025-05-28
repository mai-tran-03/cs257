// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp.
// Cuts down the dropdown list as strings are searched.
export function filterResults() {
    let input = document.getElementById("searchBar");
    let searchText = input.value.toUpperCase();
    let ul = document.getElementById("searchCountries");
    let li = ul.getElementsByTagName("li");

    for (let i = 0; i < li.length; i++) {
        let a = li[i].querySelector("a");
        let textValue = a.textContent || a.innerText;
        if (textValue.toUpperCase().indexOf(searchText) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}