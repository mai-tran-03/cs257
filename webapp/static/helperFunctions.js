// Returns the base URL of the API, and can add endpoint components.
export function getBaseURL() {
    let baseURL = window.location.protocol
        + "//" + window.location.hostname
        + ":" + window.location.port;
    return baseURL;
}


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


// Fetches a list of all countries to fill in the country search dropdown.
function populateDropBar() {
    let baseURL = getBaseURL();

    fetch(baseURL + "/api/countries", { method: "get" })
        .then((response) => response.json())
        .then(function (result) {
            result.sort(function (a, b) {
                return a.country_name.localeCompare(b.country_name);
            });

            let ul = document.getElementById("searchCountries");

            // For each country, makes a new list item <li> and adds it to the
            // dropdown list, sets the link <a> with the country name.
            for (let i = 0; i < result.length; i++) {
                const country = result[i];
                let li = document.createElement('li');
                let a = document.createElement('a');

                a.href = baseURL + "/country/" + country.country_name;
                a.textContent = country.country_name;

                li.append(a);
                ul.append(li);
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}


// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp.
// Cuts down the dropdown list as strings are searched.
function filterResults() {
    let input = document.getElementById("searchBar");
    let searchText = input.value.toUpperCase();
    let ul = document.getElementById("searchCountries");
    let li = ul.getElementsByTagName("li");

    for (let i = 0; i < li.length; i++) {
        let a = li[i].getElementsByTagName("a");
        let textValue = a.textContent || a.innerText;
        if (textValue.toUpperCase().indexOf(searchText) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}


// To go between the names that are different on Datamap vs. our database. 
const datamapsCountryNames = [
    "United States of America",
    "Republic of the Congo",
    "West Bank", 
    "The Bahamas",
    "Somaliland", // Not in our country data, redirect to Somalia
    "Western Sahara", // We also don't have the Sahrawi Republic in the data
    "Northern Cyprus", // Same lack of data, redirect to home country
    "New Caledonia", // Same lack of data, redirect to home country
    "French Southern and Antarctic Lands", 
    "East Timor",
    "French Guiana", 
    "Swaziland"
];

const databaseCountryNames = [
    "United States",
    "Congo",
    "Palestine", 
    "Bahamas",
    "Somalia",
    "Morocco",
    "Turkey", 
    "France", 
    "France", 
    "Timor Leste",
    "France",
    "Eswatini"
];


// Function to be used for mapDone that is called when a country in a map is
// clicked. 
export function clickableCountries(dataMap, baseURL) {
    dataMap.svg.selectAll(".datamaps-subunit").on("click", function (geography, data) {
        let countryName = geography.properties.name;
        let countryNameIndex = datamapsCountryNames.indexOf(countryName);

        if (countryNameIndex > -1) {
            countryName = databaseCountryNames[countryNameIndex];
        }

        window.location.assign(baseURL + "/country/" + countryName);
    });
}


// Given a continent, returns a different projection to zoom in to that continent. 
// element is the name of the map itself and the variable  must be named required 
// by the library. If a non-valid continent name is given, or null, then returns
// the world projection.
export function projectContinent(element, name) {
    if (name === "Africa") {
        let projection = d3.geo.equirectangular()
            .center([23, 2])
            .rotate([4.4, 0])
            .scale(300)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "Asia") {
        let projection = d3.geo.equirectangular()
            .center([100, 30])
            .rotate([4, 0])
            .scale(300)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "Europe") {
        let projection = d3.geo.equirectangular()
            .center([23, 50])
            .rotate([5, 0])
            .scale(550)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "North America") {
        let projection = d3.geo.equirectangular()
            .center([-100, 40])
            .rotate([5, 0])
            .scale(390)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "Oceania") {
        let projection = d3.geo.equirectangular()
            .center([135, -20])
            .rotate([5, 0])
            .scale(400)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "South America") {
        let projection = d3.geo.equirectangular()
            .center([-60, -20])
            .rotate([5, 0])
            .scale(295)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else { // the world
        let projection = d3.geo.equirectangular()
            .center([0, 0])
            .rotate([0, 0])
            .scale(145)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    }
}

