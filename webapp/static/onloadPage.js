import { getBaseURL } from "./getBaseUrl.js";
import { populateDropBar } from "./populateDropBar.js";
import { filterResults } from "./filterResults.js";

// On window load, sets up the home button, search drop down, the map, 
// and the event listener for the submit button. 
export function initalize() {

    // links home button
    document.getElementById("home").href = getBaseURL();

    // sets up search bar drop down
    let searchElement = document.getElementById("searchBar");
    searchElement.addEventListener("input", filterResults);

    let searchCountriesList = document.getElementById("searchCountries");

    searchElement.addEventListener("mouseover", function () {
        searchElement.focus();
        searchCountriesList.style.visibility = "visible";
    });
    searchElement.addEventListener("mouseleave", function () {
        searchCountriesList.style.visibility = "hidden";
    });

    searchCountriesList.addEventListener("mouseover", function () {
        searchCountriesList.style.visibility = "visible";
    });
    searchCountriesList.addEventListener("mouseleave", function () {
        searchCountriesList.style.visibility = "hidden";
    });

    populateDropBar();
}