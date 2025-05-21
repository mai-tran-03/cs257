// Set up the event listeners for the search bar after loading
window.addEventListener("load", function () {
    console.log('loading......')
    let searchElement = document.getElementById("search_bar");
    searchElement.addEventListener("input", filterResults);

    populateDropBar();
});


// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp
function filterResults() {
    let input = document.getElementById("search_bar");
    let filter = input.value.toUpperCase();
    let ul = document.getElementById("search_countries");
    let li = ul.getElementsByTagName("li");
    for (let i = 0; i < li.length; i++) {
        let a = li[i].querySelector("a");
        let textValue = a.textContent || a.innerText;
        if (textValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}


// Returns the base URL of the API, onto which endpoint components can be appended.
function getBaseURL() {
    let baseURL = window.location.protocol
        + '//' + window.location.hostname
        + ':' + window.location.port;
    return baseURL;
}


function populateDropBar() {
    let url = getBaseURL() + '/api/countries';

    fetch(url, { method: 'get' })
        .then((response) => response.json())
        .then(function (result) {
            result.sort(function (a, b) {
                return a.country_name.localeCompare(b.country_name);
            });

            let ul = document.getElementById("search_countries");

            for (let i = 0; i < result.length; i++) {
                const country = result[i];
                let li = document.createElement('li');
                let a = document.createElement('a');

                // a.href = getBaseURL() + "/country/" + country.country_name;
                a.href = "#";
                a.onclick = function (e) {
                    e.preventDefault();
                    getCountryFromAPI(country.country_name);
                };
                a.textContent = country.country_name;

                li.append(a);
                ul.append(li);
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}


function getCountryFromAPI(name) {
    // location.href = 'country.html';
    let url = getBaseURL() + '/api/country/' + name;

    fetch(url, { method: 'get' })
        .then((response) => response.json())
        .then(function (result) {
            writeCountryInfo(result);
        })
        .catch(function (error) {
            console.log(error);
        });
}


const countryStats = ["other_names", "area", "population", "continent_id", "main_hue"];
const countryStatsHeaders = ["Other names: ", "Area (sq km): ", "Population: ", "Continent: ", "Main hue: "];
const colors = ["red", "green", "blue", "gold_yellow", "white", "black_grey", "orange_brown", "pink_purple"];
const colorsHeaders = ["Red", "Green", "Blue", "Gold/yellow", "White", "Black/grey", "Orange/brown", "Pink/purple"];
const symbols = ["bars", "stripes", "bends", "circles", "crosses", "saltires", "quarters", "sun_stars", "crescent_moon", "triangle", "inanimate_image", "animate_image", "text", "crest_emblem", "border", "trapezoid"]

// Input: the JSON object of the country gotten from the database 
function writeCountryInfo(country) {
    const container = document.getElementById("country_info");
    document.getElementById("country_name").innerText = country.country_name;

    document.getElementById("country_flag").src = "./flag_images/" + country.tld + ".png";

    let attributesList = document.getElementById("attributes");

    for (let i = 0; i < countryStats.length; i++) {
        if (country.countryStats[i] !== null) {
            let li = document.createElement('li');
            li.innerText = countryStatsHeaders[i] + country.countryStats[i];
            attributesList.append(li);
        }
    }

    let colorsList = document.createElement("ul");
    for (let i = 0; i < colors.length; i++) {
        if (country.colors[i] !== 0) {
            let li = document.createElement('li');
            li.innerText = countryStatsHeaders[i];
            colorsList.append(li);
        }
    }

    let colorsListItem = document.createElement('li');
    colorsListItem.innerText = "Colors:";
    colorsListItem.append(colorsList);
    attributesList.append(colorsListItem);

}