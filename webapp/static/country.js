/* 
    Mai Tran and Kezia Sharnoff
    May 2025

    Javascript for the single country display page of the countries' flags
    webapp. This draws the map (zoomed into the continent, selected country
    colored, other countries have hover popups with names) and fills in the
    table with information. 
*/


import { initalize, getBaseURL, projectContinent, clickableCountries } from './helperFunctions.js';

// On window load, sets up the home button, search drop down, the map, 
// and the event listener for the submit button.
window.addEventListener("load", function () {
    initalize();

    let countryName = getNameFromUrl();
    getCountryFromAPI(countryName);

    zoomInFlagAnimation();
})

// Return the country name from the URL of the form:
// http://[baseURL]/country/<name>
function getNameFromUrl() {
    const url = window.location.toString();
    const lastBackSlash = url.lastIndexOf("/") + 1;
    if (lastBackSlash == url.length) {
        return "";
    }
    return url.substring(lastBackSlash);
}

// Fetch information about a specific country from the API
function getCountryFromAPI(name) {
    const url = getBaseURL() + "/api/country/" + name;

    fetch(url, { method: "get" })
        .then((response) => response.json())
        .then(function (result) { // result is a list of max length two
            console.log(result);
            writeCountryInfo(result);
            initializeMap(result.iso3, result.continent_name);
        })
        .catch(function (error) {
            console.log("error in getCountryFromAPI()");
            console.log(error);

        });
}

// Objects to format the country attributes from how they are stored in the
// database to how we want to display them in the tables.
const formattedCountryInfo = {
    other_names: "Other names",
    area: "Area (sq km)",
    population: "Population",
    continent_name: "Continent",
    main_hue: "Main hue", 
    languages: "Language(s)"
};
const formattedColors = {
    red: "Red",
    green: "Green",
    blue: "Blue",
    gold_yellow: "Gold/yellow",
    white: "White",
    black_grey: "Black/grey",
    orange_brown: "Orange/brown",
    pink_purple: "Pink/purple"
}
const formattedSymbolsSingular = {
    bars: "Bar",
    stripes: "Stripe",
    circles: "Circle",
    crosses: "Cross",
    saltires: "Saltire",
    quarters: "Quarter",
    sun_stars: "Sun/stars",
    crescent_moon: "Crescent moon(s)",
    triangle: "Triangl(s)",
    inanimate_image: "Inanimate image(s)",
    animate_image: "Animate image(s)",
    text: "Text",
    crest_emblem: "Crest/emblem(s)",
    border: "Border",
    trapezoid: "Trapezoid(s)"
}
const formattedSymbolsPlural = {
    bars: "Bars",
    stripes: "Stripes",
    circles: "Circles",
    crosses: "Crosses",
    saltires: "Saltires",
    quarters: "Quarters",
    sun_stars: "Sun/stars",
    border: "Borders",
}

// Inputs the the country information from SQL. Draws to the screen the couuntry
// attributes and flag data.  
function writeCountryInfo(country) {
    // if country couldn't be returned from SQL: 
    if (country === undefined || country.country_name === undefined) {
        document.getElementById("errorMessage").innerText = "\n\n\nNo data corresponding to that country name!";
        document.getElementById("countryFlag").style.visibility = "hidden";
        document.getElementById("mapContainer").style.visibility = "hidden";
        document.getElementById("mapCaption").style.visibility = "hidden";
        return;
    }

    // name and flag in the country table
    document.getElementById("countryName").innerText = country.country_name;
    document.getElementById("countryFlag").src = "../static/flag_images/" + country.tld + ".png";

    // name and flag in the tab title and icon
    document.getElementById("favicon").href = "../static/flag_images/" + country.tld + ".png";
    document.title = country.country_name;


    // general country info 
    let infoTable = document.getElementById("infoTable");

    for (const [key, value] of Object.entries(formattedCountryInfo)) {
        if (country[key] == undefined) {
            continue;
        }

        let tableRow = document.createElement("tr");
        let statsName = document.createElement("td");

        const statsNameText = value;
        statsName.append(document.createTextNode(statsNameText));
        statsName.className = "textRight";

        let statsCount = document.createElement("td");
        let statsCountText = country[key];

        if (key == "languages") {
            statsCountText = statsCountText.toString();
            // add spaces between the elements in the array
            statsCountText = statsCountText.replace(",", ", "); 
        } 

        // if it is a number (area, population), format it with commas in
        // the thousands places
        if (typeof statsCountText == "number") {
            statsCountText = new Intl.NumberFormat("en", {
                useGrouping: "always"
            }).format(statsCountText);
        }

        // Capitalize first letter of the color
        if (key == "main_hue") {
            if (formattedColors[country[key]] !== undefined) {
                statsCountText = formattedColors[country[key]];
            } else { // cannot guarentee known format, eg: black vs. black_gray
                let firstLetter = (statsCountText.charAt(0)).toUpperCase();
                statsCountText = firstLetter + statsCountText.slice(1);
            }
        }

        statsCount.append(document.createTextNode(statsCountText));
        statsCount.className = "textLeft";

        tableRow.append(statsName);
        tableRow.append(statsCount);
        infoTable.append(tableRow);
    }
    // All tables are hidden by default and only visible once the information 
    // is put in successfully
    infoTable.style.visibility = "visible";

    // colors
    let colorsTable = document.getElementById("colorsTable");

    for (const [key, value] of Object.entries(formattedColors)) {
        if (country[key] == false || country[key] == undefined) {
            continue;
        }
        let tableRow = document.createElement("tr");
        let colorName = document.createElement("td");

        colorName.append(document.createTextNode(value));
        colorName.className = "textCenter";

        tableRow.append(colorName);
        colorsTable.append(tableRow);
    }

    colorsTable.style.visibility = "visible";


    // symbols
    let symbolTable = document.getElementById("symbolTable");

    for (const [key, value] of Object.entries(formattedSymbolsSingular)) {
        if (country[key] == 0 || country[key] == undefined) {
            continue;
        }
        let tableRow = document.createElement("tr");
        let symbolName = document.createElement("td");
        let symbolCount = document.createElement("td");

        symbolName.className = "textRight";
        symbolCount.className = "textLeft";

        // if boolean, use single word
        if (typeof country[key] == "boolean") {
            symbolName.append(document.createTextNode(value));
            symbolName.colSpan = 2;
            symbolName.className = "textCenter";
            symbolCount.classList.add("empty");
        } else if (country[key] == 1) { // if count = one, use single word
            symbolName.append(document.createTextNode(value));
            symbolCount.append(document.createTextNode("1"));
        } else { // use plural word
            symbolName.append(document.createTextNode(formattedSymbolsPlural[key]));
            symbolCount.append(document.createTextNode(country[key]));
        }

        tableRow.append(symbolName);
        tableRow.append(symbolCount);
        symbolTable.append(tableRow);
    }

    symbolTable.style.visibility = "visible";
}

/*
 * Datamaps is Copyright (c) 2012 Mark DiMarco
 * https://github.com/markmarkoh/datamaps
 */

// Draw a map with only the given country input highlighted. Also inputs 
// formatted data of all countries with their tld and name stored, to be used
// in the hover pop ups. 
function drawMap(continentName, countriesData) {
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
        data: countriesData,
        fills: { defaultFill: "#999999" },
        geographyConfig: {
            highlightFillColor: "#2293b8", // color when you hover on a country
            highlightBorderColor: "#06465c",
            hideAntarctica: true,
            popupTemplate: hoverPopup
        }
    });

    // Write a caption below the map with the continent name,
    // this happens after the map is drawn so that if the Javascript fails in
    // drawing the map, this will not happen.
    document.getElementById("mapCaption").innerText = "Continent: " + continentName;
}

// Fetch requests to get list of all countries' names, tld, and ISO in order 
// to make the hover popups. Inputs single country ISO in order to set the color
// of the selected country.
function initializeMap(selectedCountryISO, continentName) {
    // Do not show the map if we cannot later draw the selected country as a color
    if (selectedCountryISO == undefined || continentName == undefined) {
        document.getElementById("mapContainer").style.visibility = "hidden";
        document.getElementById("mapCaption").style.visibility = "hidden";
        return;
    }

    const url = getBaseURL() + "/api/countries?"

    fetch(url, { method: "get" })
        .then((response) => response.json())
        .then(function (result) { 

            // format the country data so that it can be used in the hover pop
            // ups. Store the tld and name, change the fill color of the 
            // selected country. 
            let countriesData = {};
            for (const c of result) {
                let countryData = {};
                countryData["countryName"] = c["country_name"];
                countryData["tld"] = c["tld"];

                if (c.iso3 == selectedCountryISO) {
                    countryData["fillColor"] = "#f54242";
                }

                countriesData[c.iso3] = countryData;
            }

            drawMap(continentName, countriesData);
        })
        .catch(function (error) {
            console.log("error in initializeMap()");
            console.log(error);
        });
}

// Returns the div for the hover popup, formatting the inputted country data. 
function hoverPopup(geography, data) {
    if (data == undefined || data.tld == undefined || data.countryName == undefined) {
        return;
    }
    let template = "<div class='hoverpopup'>";

    template += "<img class='hoverpopupFlag' src='../static/flag_images/" + data.tld + ".png'>";

    template += "<strong> " + data.countryName + "</strong><br>\n";

    template += "</div>";

    return template;
}

// Taken from https://www.w3schools.com/css/tryit.asp?filename=trycss_image_modal_js.
// Trigger a modal (dialog box) to zoom into the flag image with a close button.
function zoomInFlagAnimation() {
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