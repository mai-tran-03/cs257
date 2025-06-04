import { initalize } from "./onloadPage.js";
import { getBaseURL } from "./getBaseUrl.js";
import { projectContinent } from "./projectContinent.js";
import { clickableCountries } from "./mapDoneFunc.js";

// On window load, in addition to inital page set up, draw a map and allow users
// to search attributes of countries with checkboxes and selectors.

window.addEventListener("load", function () {
    initalize();
    const map = drawMap({}, null);

    document.getElementById("submit").addEventListener("click", function () {
        searchAttributes(map);
    });

    // const dropDown = document.getElementsById("dropDown");
    // const countrySelect = document.getElementsById("countrySelect");
    // dropDown.addEventListener("click", function () {
    //     if (countrySelect.style.display === "block") {
    //         countrySelect.style.display = "none";
    //     } else {
    //         countrySelect.style.display = "block";
    //     }
    // });
})

// Makes the URL with the get parameters based on the clicked checkboxes
// of the flag attributes. Returns an object with the getParams as a URL
// to be used and returns the continent (so that we don't need to find it
// later from the get parameters).
function makeGetParams() {
    // make the get parameters with the flag attributes
    let attributeBoxes = document.getElementById("attributeBoxes");
    let getParams = getBaseURL() + "/api/countries?";

    let attributes = {};

    let selectedContinent = document.querySelector("input[name='continents']:checked");
    if (selectedContinent.value !== "All") {
        getParams += "continent=" + selectedContinent.value + "&";
        attributes["continent"] = selectedContinent.value;
    } else {
        attributes["continent"] = null;
    }

    let noAttribute = true;

    let checkBoxes = attributeBoxes.querySelectorAll("input[type='checkbox']");
    for (let i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i];

        if (checkBox.checked) {
            noAttribute = false;
            getParams += checkBox.id + "=1&";
        }
    }

    attributes["noAttribute"] = noAttribute;

    // To avoid substringing an empty string, if no attributes are added, 
    // then return null.
    if (noAttribute) {
        attributes["getParams"] = getParams;
        return attributes;
    }

    // remove extra '&' from the end
    getParams = getParams.substring(0, getParams.length - 1);

    attributes["getParams"] = getParams;
    return attributes;
}

// After clicking submit, all of the attributes that are clicked are found,
// the information is fetched, the old map is deleted, the new one is drawn.
function searchAttributes(map) {
    let attributes = makeGetParams();
    let getParams = attributes["getParams"];
    let continent = attributes["continent"];
    let noAttribute = attributes["noAttribute"];

    // delete the old map (hover popups are broken if this does not happen)
    document.getElementById("mapContainer").remove();

    // create a new map with the same ID as the old one
    let newMap = document.createElement("div");
    newMap.id = "mapContainer";
    document.getElementById("mapDiv").append(newMap);

    // Fetch the list of countries that fall under those attributes,
    // redraw the map with them, taking into account what continent to 
    // display. 
    fetch(getParams, { method: "get" })
        .then((response) => response.json())
        .then(function (result) {
            let newMapData = getMapData(result, noAttribute);
            drawMap(newMapData, continent);
        })
        .catch(function (error) {
            console.log(error);
        });
}

// Sets the data for the new map by applying each country the attributes
// and their values and making each selected country be colored. 
function getMapData(countries, noAttribute) {
    // countries is a list of dictionaries with the selected attributes
    let countriesData = {};

    for (let i = 0; i < countries.length; i++) {
        let country = countries[i];
        let countryData = {};
        let hasAllAttributes = true;

        // for every attribute (key) and its amount (value), add it to the
        // map data for that country
        for (const [key, value] of Object.entries(country)) {
            if (key === "iso3") {
                continue;
            }

            if (value == 0 || value == false) {
                hasAllAttributes = false;
                countryData = {};
                countryData["country_name"] = country["country_name"];
                countryData["tld"] = country["tld"];
                break;
            }

            countryData[key] = value;
        }
        if (hasAllAttributes && !noAttribute) {
            countryData["fillColor"] = "#f54242";
        }

        countriesData[country.iso3] = countryData;
    }
    return countriesData;
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
            hideAntarctica: false,
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
        if (key === "country_name" || key === "iso3" || key === "fillColor" || key === "tld") {
            continue;
        }
        template += "<strong> " + formattedAttributes[key] + "</strong>" + value + "<br>\n";
    }
    template += "</div>";

    return template;
}