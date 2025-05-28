import { onloadPage } from "./onloadPage.js";
import { getBaseURL } from "./getBaseUrl.js";
import { projectContinent } from "./projectContinent.js";

// On window load, sets up the home button, search drop down, the map, 
// and the event listener for the submit button.
onloadPage({
    addon: () => {
        getCountryFromAPI(getNameFromUrl());
    }
});

// Get the country name from the URL of the form:
// http://[baseURL]/country/<name>
function getNameFromUrl() {
    let url = window.location.toString();
    let lastBackSlash = url.lastIndexOf("/") + 1;
    if (lastBackSlash == url.length) {
        return "";
    }
    return url.substring(lastBackSlash);
}

// Fetch information about a specific country from the API
function getCountryFromAPI(name) {
    let url = getBaseURL() + "/api/country/" + name;

    fetch(url, { method: "get" })
        .then((response) => response.json())
        .then(function (result) {
            writeCountryInfo(result);
            initializeMap(result);
        })
        .catch(function (error) {
            console.log(error);
        });
}

const countryStats = ["other_names", "area", "population", "continent_name", "main_hue"];
const countryStatsHeaders = ["Other names: ", "Area (sq km): ", "Population: ", "Continent: ", "Main hue: "];
const colors = ["red", "green", "blue", "gold_yellow", "white", "black_grey", "orange_brown", "pink_purple"];
const colorHeaders = ["Red", "Green", "Blue", "Gold/yellow", "White", "Black/grey", "Orange/brown", "Pink/purple"];
const symbols = ["bars", "stripes", "bends", "circles", "crosses", "saltires", "quarters", "sun_stars", "crescent_moon", "triangle", "inanimate_image", "animate_image", "text", "crest_emblem", "border", "trapezoid"]
const symbolHeadersSingular = ["Bar: 1", "Stripe: 1", "Bend: 1", "Circle: 1", "Cross: 1", "Saltire: 1", "Quarter: 1", "Sun/star: 1", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]
const symbolHeadersPlural = ["Bars: ", "Stripes: ", "Bends: ", "Circles: ", "Crosses: ", "Saltires: ", "Quarters: ", "Sun/stars: ", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]

// Inputs the the country information from SQL. Draws to the screen the couuntry
// attributes and flag data.  
function writeCountryInfo(country) {
    // if country couldn't be returned from SQL: 
    if (country.country_name === undefined) {
        document.getElementById("countryFlag").style.visibility = "hidden";
        document.getElementById("mapContainer").style.visibility = "hidden";
        document.getElementById("attributes").innerText = "No country is known by that name!";
        return;
    }

    // name and flag
    document.getElementById("countryName").innerText = country.country_name;
    document.getElementById("countryFlag").src = "../static/flag_images/" + country.tld + ".png";

    // country attributes
    let attributesList = document.getElementById("attributes");

    for (let i = 0; i < countryStats.length; i++) {
        if (country[countryStats[i]] !== null) {
            let li = document.createElement("li");
            li.innerText = countryStatsHeaders[i] + country[countryStats[i]];
            attributesList.append(li);
        }
    }

    // colors
    let colorsList = document.createElement("ul");
    for (let i = 0; i < colors.length; i++) {
        if (country[colors[i]]) {
            let li = document.createElement("li");
            li.innerText = colorHeaders[i];
            colorsList.append(li);
        }
    }

    let colorsListItem = document.createElement("li");
    colorsListItem.innerText = "Colors:";
    colorsListItem.append(colorsList);
    attributesList.append(colorsListItem);

    // symbols
    let symbolsList = document.createElement("ul");
    for (let i = 0; i < symbols.length; i++) {
        if (country[symbols[i]] != 0) {
            let li = document.createElement("li");
            if ((typeof country[symbols[i]] == "boolean") || (country[symbols[i]] == 1)) {
                li.innerText = symbolHeadersSingular[i];
            } else {
                li.innerText = symbolHeadersPlural[i] + country[symbols[i]];
            }
            symbolsList.append(li);
        }
    }

    let symbolListItem = document.createElement("li");
    symbolListItem.innerText = "Symbols:";
    symbolListItem.append(symbolsList);
    attributesList.append(symbolListItem);
}

/*
 * Datamaps is Copyright (c) 2012 Mark DiMarco
 * https://github.com/markmarkoh/datamaps
 */

// Draw a map with only the given country input highlighted.
function initializeMap(country) {
    let countryData = {};
    let continentName = country.continent_name;
    countryData[country.iso3] = { fillColor: "#f54242" };

    new Datamap({
        element: document.getElementById("mapContainer"),
        scope: "world",
        projection: "equirectangular",
        setProjection: function (element) {
            return projectContinent(element, continentName);
        },
        done: function () { },
        data: countryData,
        fills: { defaultFill: "#999999" },
        geographyConfig: {
            popupOnHover: false,
            highlightOnHover: false,
            hideAntarctica: false,
        }
    });
}