/* 
    Mai Tran and Kezia Sharnoff
    May 2025

    Javascript for the home page of the webapp. On this page, you can navigate
    to a single country display by searching or clicking the map. You can also
    see as lists or by map colors what countries' flags fit in the selected 
    attributes. The code makes the map, the search dropdown, the reset
    button, and the attributes search upon clicking submit. 
*/

import { initalize, getBaseURL, projectContinent, clickableCountries } from "./helperFunctions.js";

// On window load, in addition to inital page set up, draw a map and allow users
// to search attributes of countries with checkboxes and selectors.
window.addEventListener("load", function () {
    initalize();

    // Run once the page is loaded so that a map is drawn and its hover popups
    // filled in to begin with. 
    searchAttributes();

    document.getElementById("submit").addEventListener("click", function () {
        searchAttributes();
    });

    document.getElementById("resetButton").addEventListener("click", function() {
        resetCheckboxes();
    });
})

// Reset the attribute checkboxes, the continent selector, and redraw the map.
// Called when the reset button is pressed.
function resetCheckboxes() {
    // set the continent to all
    let continent = document.getElementById("allContinents");
    continent.checked = true;

    // set the attribute checkboxes to be not checked
    const checkBoxes = attributeBoxes.querySelectorAll("input[type='checkbox']");
    for (let i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i];
        checkBox.checked = false;
    }

    // draw the map as blank and fill in with the hover popups 
    searchAttributes();
}

// Makes the URL with the get parameters based on the clicked checkboxes
// of the flag attributes. Returns an object with the getParams as a URL
// to be used and returns the continent (so that we don't need to find it
// later from the get parameters). Also returns noAttribute which is a 
// boolean that marks whether something was selected.
function makeGetParams() {
    // make the get parameters with the flag attributes
    const attributeBoxes = document.getElementById("attributeBoxes");
    let getParams = getBaseURL() + "/api/countries?";

    let attributes = {};

    const selectedContinent = document.querySelector("input[name='continents']:checked");
    if (selectedContinent.value !== "All") {
        getParams += "continent=" + selectedContinent.value + "&";
        attributes["continent"] = selectedContinent.value;
    } else {
        attributes["continent"] = null;
    }

    let noAttribute = true;

    const checkBoxes = attributeBoxes.querySelectorAll("input[type='checkbox']");
    for (let i = 0; i < checkBoxes.length; i++) {
        const checkBox = checkBoxes[i];

        if (checkBox.checked) {
            noAttribute = false;
            getParams += checkBox.id + "=1&";
        }
    }

    attributes["noAttribute"] = noAttribute;

    // remove extra '&' from the end or the extra '?' if no attributes
    getParams = getParams.substring(0, getParams.length - 1);

    attributes["getParams"] = getParams;
    return attributes;
}

// After clicking submit, all of the attributes that are clicked are found,
// the information is fetched, the old map is deleted, the new one is drawn.
function searchAttributes() {
    // get information from the checkboxes: the URL with the get parameters
    // for the fetch, the continent, and if it is empty
    let attributes = makeGetParams();
    let getParams = attributes["getParams"];
    let continent = attributes["continent"];
    let noAttribute = attributes["noAttribute"];

    // recreate map, so that the new hover popup works
    deleteMapDivCreateNew();

    // Fetch the list of countries that fall under those attributes,
    // redraw the map with them, taking into account what continent to 
    // display. 
    fetch(getParams, { method: "get" })
        .then((response) => response.json())
        .then(function (result) {
            let newMapData = getMapData(result, noAttribute, continent);
            displayCountryList(newMapData);
            drawMap(newMapData, continent);
        })
        .catch(function (error) {
            console.log(error);
        });
}

// Deletes the old map container from the DOM and creates a new one. This is
// to fix the hover pop ups. 
function deleteMapDivCreateNew() {
     // delete the old map (hover popups are broken if this does not happen)
    document.getElementById("mapContainer").remove();

    // create a new map with the same ID as the old one
    let newMap = document.createElement("div");
    newMap.id = "mapContainer";
    document.getElementById("mapDiv").append(newMap);
}

// Sets the data for the new map by applying each country the attributes
// and their values and making each selected country be colored. noAttribute
// is inputted true when there was nothing selected, then no countries should
// be colored in. Only the countries within the inputted continent will have
// data, if continent is null then that is all the countries.
// Inputs countries, data from the fetch request of the database, dictionaries
// each representing a country and its values for the selected attributes. 
// Returns the formatted country data for the map.
function getMapData(countries, noAttribute, continent) {
    // countries is a list of dictionaries with the selected attributes
    let countriesData = {};

    for (let i = 0; i < countries.length; i++) {
        const country = countries[i];
        let countryData = {};
        let hasAllAttributes = true;
        let correctContinent = true;

        if (continent !== null) {
            if (country["continent_name"] !== continent) {
                correctContinent = false;
            }
        }

        // for every attribute (key) and its amount (value), add it to the
        // map data for that country
        for (const [key, value] of Object.entries(country)) {
            if (key === "iso3") { // will not need the iso3 later, no need to store
                continue;
            }

            if (value == 0 || value == false || !correctContinent) {
                // erase all the possible other values already added to the template
                countryData = {};
                countryData["country_name"] = country["country_name"];
                countryData["tld"] = country["tld"];
                hasAllAttributes = false;
                break;
            }

            countryData[key] = value;
        }
        if (hasAllAttributes && !noAttribute && correctContinent) {
            countryData["fillColor"] = "#f54242";
        }

        countriesData[country.iso3] = countryData;
    }
    return countriesData;
}

// Takes in all countries data, and displays a table of only the countries 
// with the selected attributes, each row has one column contains the flag 
// and another shows the country name.
function displayCountryList(countries) {
    const countryTable = document.getElementById("selectedCountryTable");

    for (const iso3 in countries) {
        const country = countries[iso3];

        // skip countries with no selected attributes
        if (Object.keys(country).length < 3) {
            continue;
        }

        let tableRow = document.createElement("tr");
        const countryInfoLink = getBaseURL() + "/country/" + country.country_name;

        // name column with link to country info page
        let countryName = document.createElement("td");
        let textLink = document.createElement("a");
        textLink.href = countryInfoLink;
        textLink.append(document.createTextNode(country.country_name));
        countryName.append(textLink);
        countryName.className = "textLeft";

        // flag image column with link to country info page
        let flag = document.createElement("td");
        let img = document.createElement("img");
        let imgLink = document.createElement("a");
        imgLink.href = countryInfoLink;
        img.src = "../static/flag_images/" + country.tld + ".png";
        imgLink.append(img);
        flag.append(imgLink);

        tableRow.append(flag);
        tableRow.append(countryName);
        countryTable.append(tableRow);
    }

    // ensure the table that is divided into three column will be filled 
    // with empty cells if the total number of rows is not evenly divisible
    const tableNumRow = countryTable.rows.length;
    if (tableNumRow % 3 == 2) {
        const lastCell = document.createElement("tr");
        countryTable.append(lastCell);
    } else if (tableNumRow % 3 == 1) {
        const secondToLastCell = document.createElement("tr");
        const lastCell = document.createElement("tr");
        countryTable.append(secondToLastCell);
        countryTable.append(lastCell);
    }

    // reset the current table when the submit or reset button is clicked again
    document.getElementById("submit").addEventListener("click", function () {
        countryTable.innerHTML = "";
    });
    document.getElementById("resetButton").addEventListener("click", function () {
        countryTable.innerHTML = "";
    });
}

/*
 * Datamaps is Copyright (c) 2012 Mark DiMarco
 * https://github.com/markmarkoh/datamaps
 */

// Draws a map of the inputted continent (or the world if null) while coloring 
// in the selected countries. countriesData also includes the attributes 
// information which is used in the hover pop ups. 
function drawMap(countriesData, continent) {
    new Datamap({
        element: document.getElementById("mapContainer"),
        scope: "world",
        projection: "equirectangular",
        setProjection: function (element) {
            return projectContinent(element, continent);
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
}

// Object with attribute names and their better formatted versions to
// replace them in the hover pop up. 
const formattedAttributes = {
    red: "Red: ",
    green: "Green: ",
    blue: "Blue: ",
    gold_yellow: "Gold/yellow: ",
    white: "White: ",
    black_grey: "Black/grey: ",
    orange_brown: "Orange/brown: ",
    pink_purple: "Pink/purple: ",
    bars: "Bars: ",
    stripes: "Stripes: ",
    circles: "Circles: ",
    crosses: "Crosses: ",
    saltires: "Saltires: ",
    quarters: "Quarters: ",
    sun_stars: "Sun/stars: ",
    crescent_moon: "Crescent moon: ",
    triangle: "Triangle: ",
    inanimate_image: "Inanimate image: ",
    animate_image: "Animate image: ",
    text: "Text: ",
    crest_emblem: "Crest/emblem: ",
    border: "Border: ",
    trapezoid: "Trapezoid: "
};

// Returns <div> for the hover pop up that appears in the world map for each
// country. Inputs the data of the entire map and geography of the country 
// highlighted because the library needs geography to be inputted. 
// The hover pop up has the attributes well formatted with their data. 
function hoverPopup(geography, data) {
    let template = "<div class='hoverpopup'>";

    template += "<img class='hoverpopupFlag' src='../static/flag_images/" + data.tld + ".png'>";

    template += "<strong> " + data.country_name + "</strong><br>\n";

    for (const [key, value] of Object.entries(data)) {
        if (key === "country_name" || key === "iso3" || key === "fillColor" ||
            key === "tld" || key === "continent_name") {
            continue;
        }
        template += "<strong> " + formattedAttributes[key] + "</strong>" + value + "<br>\n";
    }
    template += "</div>";

    return template;
}