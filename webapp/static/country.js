import { onloadPage } from "./onloadPage.js";
import { getBaseURL } from "./getBaseUrl.js";
import { projectContinent } from "./projectContinent.js";
import { clickableCountries } from "./mapDoneFunc.js";

// On window load, sets up the home button, search drop down, the map, 
// and the event listener for the submit button.
onloadPage({
    addon: () => {
        getCountryFromAPI(getNameFromUrl());
        zoomInImage();
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
const countryStatsHeaders = ["Other names", "Area (sq km)", "Population", "Continent", "Main hue"];
const colors = ["red", "green", "blue", "gold_yellow", "white", "black_grey", "orange_brown", "pink_purple"];
const colorHeaders = ["Red", "Green", "Blue", "Gold/yellow", "White", "Black/grey", "Orange/brown", "Pink/purple"];
const symbols = ["bars", "stripes", "bends", "circles", "crosses", "saltires", "quarters", "sun_stars", "crescent_moon", "triangle", "inanimate_image", "animate_image", "text", "crest_emblem", "border", "trapezoid"]
const symbolHeadersSingular = ["Bar", "Stripe", "Bend", "Circle", "Cross", "Saltire", "Quarter", "Sun/star", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]
const symbolHeadersPlural = ["Bars", "Stripes", "Bends", "Circles", "Crosses", "Saltires", "Quarters", "Sun/stars", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]

// Inputs the the country information from SQL. Draws to the screen the couuntry
// attributes and flag data.  
function writeCountryInfo(country) {
    // if country couldn't be returned from SQL: 
    if (country.country_name === undefined) {
        document.getElementById("errorMessage").innerText = "\n\n\nNo data corresponding to that country name!";
        document.getElementById("countryFlag").style.visibility = "hidden";
        document.getElementById("mapContainer").style.visibility = "hidden";
        document.getElementById("mapCaption").style.visibility = "hidden";
        return;
    }

    // name and flag
    document.getElementById("countryName").innerText = country.country_name;
    document.getElementById("countryFlag").src = "../static/flag_images/" + country.tld + ".png";

    // general country info 
    let infoTable = document.getElementById("infoTable");

    for (let i = 0; i < countryStats.length; i++) {
        if (country[countryStats[i]] !== null) {
            let tableRow = document.createElement("tr");
            let statsName = document.createElement("td");

            statsName.append(document.createTextNode(countryStatsHeaders[i]));
            statsName.className = "textRight";

            let statsCount = document.createElement("td");

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
    // It is hidden by default and only visible once the information is put in 
    infoTable.style.visibility = "visible";

    // colors
    let colorsTable = document.getElementById("colorsTable");

    for (let i = 0; i < colors.length; i++) {
        if (country[colors[i]]) {
            let tableRow = document.createElement("tr");
            let colorName = document.createElement("td");

            colorName.append(document.createTextNode(colorHeaders[i]));
            colorName.className = "textCenter";

            tableRow.append(colorName);
            colorsTable.append(tableRow);
        }
    }

    colorsTable.style.visibility = "visible";


    // symbols
    let symbolTable = document.getElementById("symbolTable");

    for (let i = 0; i < symbols.length; i++) {
        if (country[symbols[i]] != 0) {
            let tableRow = document.createElement("tr");
            let symbolName = document.createElement("td");
            let symbolCount = document.createElement("td");

            symbolName.className = "textRight";
            symbolCount.className = "textLeft";

            if (typeof country[symbols[i]] == "boolean") {
                symbolName.append(document.createTextNode(symbolHeadersSingular[i]));
                symbolName.colSpan = 2;
                symbolName.className = "textCenter";
                symbolCount.classList.add("empty");
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

    symbolTable.style.visibility = "visible";
}

/*
 * Datamaps is Copyright (c) 2012 Mark DiMarco
 * https://github.com/markmarkoh/datamaps
 */

// Draw a map with only the given country input highlighted.
function initializeMap(country) {
    let countryData = {};
    let continentName = country.continent_name;
    countryData[country.iso3] = { fillColor: "#f7df07" };

    new Datamap({
        element: document.getElementById("mapContainer"),
        scope: "world",
        projection: "equirectangular",
        setProjection: function (element) {
            return projectContinent(element, continentName);
        },
        done: function (datamap) {
            return clickableCountries(datamap, getBaseURL());
        },
        data: countryData,
        fills: { defaultFill: "#999999" },
        geographyConfig: {
            popupOnHover: false,
            highlightFillColor: "#16b538", // color when you hover on a country
            highlightBorderColor: "#156326",
            hideAntarctica: false,
        }
    });

    // Write a caption above the map with the continent name,
    // this happens after the map is drawn so that if the javascript fails in
    // drawing the map, this will not happen.
    document.getElementById("mapCaption").innerText = "Continent: " + country.continent_name;
}

// Taken from https://www.w3schools.com/css/tryit.asp?filename=trycss_image_modal_js.
// Trigger a modal (dialog box) to zoom into the flag image with a close button.
function zoomInImage() {
    let imgZoom = document.getElementById("imgZoom");

    let flagImg = document.getElementById("countryFlag");
    let zoomedFlagImg = document.getElementById("zoomedFlagImg");
    flagImg.onclick = function () {
        imgZoom.style.display = "block";
        zoomedFlagImg.src = flagImg.src;
    }

    let span = document.getElementsByClassName("close")[0];
    span.onclick = function () {
        imgZoom.style.display = "none";
    }

    imgZoom.onclick = function () {
        imgZoom.style.display = "none";
    }
} 