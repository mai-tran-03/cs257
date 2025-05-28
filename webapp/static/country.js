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
const symbolHeadersSingular = ["Bar: ", "Stripe: ", "Bend: ", "Circle: ", "Cross: ", "Saltire: ", "Quarter: ", "Sun/star: ", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]
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


    // general country info 
    let infoTable = document.getElementById("infoTable");

    for (let i = 0; i < countryStats.length; i++) {
        if (country[countryStats[i]] !== null) {
            let tableRow = document.createElement('tr');
            let statsName = document.createElement('td');

            statsName.append(document.createTextNode(countryStatsHeaders[i]));
            statsName.className = "textRight";

            let statsCount = document.createElement('td');

            // if it is a number (area, population), format it with commas in
            // the thousands places
            let statsCountText = country[countryStats[i]];
            if (typeof statsCountText == "number") {
                statsCountText = new Intl.NumberFormat("en", {
                  useGrouping: "always"
                }).format(statsCountText);
            }

            statsCount.append(document.createTextNode(statsCountText));
            statsCount.className = "textLeft";

            tableRow.append(statsName);
            tableRow.append(statsCount);
            infoTable.append(tableRow);
        }
    }

    // colors
    let colorsTable = document.getElementById("colorsTable");

    for (let i = 0; i < colors.length; i++) {
        if (country[colors[i]]) {
            let tableRow = document.createElement('tr');
            let colorName = document.createElement('td');

            colorName.append(document.createTextNode(colorHeaders[i]));
            colorName.className = "textCenter";

            tableRow.append(colorName);
            colorsTable.append(tableRow);
        }
    }


    // symbols
    let symbolTable = document.getElementById("symbolTable");

    for (let i = 0; i < symbols.length; i++) {
        if (country[symbols[i]] != 0) {
            let tableRow = document.createElement('tr');
            let symbolName = document.createElement('td');
            let symbolCount = document.createElement('td');

            symbolName.className = "textRight";
            symbolCount.className = "textLeft";


            let li = document.createElement('li');
            if (typeof country[symbols[i]] == "boolean") {
                symbolName.append(document.createTextNode(symbolHeadersSingular[i]));
            } else if (country[symbols[i]] == 1) {
                symbolName.append(document.createTextNode(symbolHeadersSingular[i]));
                symbolCount.append(document.createTextNode("1"));
            } else {
                symbolName.append(document.createTextNode(symbolHeadersPlural[i]));
                symbolCount.append(document.createTextNode(country[symbols[i]]));
            }

            tableRow.append(symbolName);
            tableRow.append(symbolCount);
            symbolTable.append(tableRow);
        }
    }

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

    new Datamap({ element: document.getElementById('mapContainer'),
                    scope: 'world', 
                    projection: 'equirectangular', 
                    setProjection: function(element) {
                        return continentProjection(element, continentName);
                    },
                    done: function() {}, 
                    data: countryData,
                    fills: { defaultFill: '#999999' },
                    geographyConfig: {
                        popupOnHover: false, 
                        highlightOnHover: false, 
                        hideAntarctica: false,
                    }
                  });

    // write a caption under the map with the continent name
    // this happens after the map is drawn so that if the javascript fails in
    // drawing the map, this will not happen
    document.getElementById("mapCaption").innerText = country.continent_name;
}