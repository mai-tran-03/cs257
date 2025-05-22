// Set up the event listeners for the search bar after loading
window.addEventListener("load", function () {
    console.log('loading......')
    let searchElement = document.getElementById("search_bar");
    searchElement.addEventListener("input", filterResults);

    populateDropBar();
    getCountryFromAPI(getNameFromUrl());
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
            console.log(result);
            result.sort(function (a, b) {
                return a.country_name.localeCompare(b.country_name);
            });

            let ul = document.getElementById("search_countries");

            for (let i = 0; i < result.length; i++) {
                const country = result[i];
                let li = document.createElement('li');
                let a = document.createElement('a');

                a.href = getBaseURL() + "/country/" + country.country_name;
                a.textContent = country.country_name;

                li.append(a);
                ul.append(li);
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}


function getNameFromUrl() {
    let url = window.location.toString();
    let lastBackSlash = url.lastIndexOf("/") + 1;
    if (lastBackSlash == url.length) {
        return "";
    }
    console.log(url.substring(lastBackSlash));
    return url.substring(lastBackSlash);
}


function getCountryFromAPI(name) {
    let url = getBaseURL() + '/api/country/' + name;

    fetch(url, { method: 'get' })
        .then((response) => response.json())
        .then(function (result) {
            writeCountryInfo(result);
            initializeMap(result);
        })
        .catch(function (error) {
            console.log(error);
        });
}


const countryStats = ["other_names", "area", "population", "continent_id", "main_hue"];
const countryStatsHeaders = ["Other names: ", "Area (sq km): ", "Population: ", "Continent: ", "Main hue: "];
const colors = ["red", "green", "blue", "gold_yellow", "white", "black_grey", "orange_brown", "pink_purple"];
const colorHeaders = ["Red", "Green", "Blue", "Gold/yellow", "White", "Black/grey", "Orange/brown", "Pink/purple"];
const symbols = ["bars", "stripes", "bends", "circles", "crosses", "saltires", "quarters", "sun_stars", "crescent_moon", "triangle", "inanimate_image", "animate_image", "text", "crest_emblem", "border", "trapezoid"]
const symbolHeadersSingular = ["Bar: 1", "Stripe: 1", "Bend: 1", "Circle: 1", "Cross: 1", "Saltire: 1", "Quarter: 1", "Sun/star: 1", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]
const symbolHeadersPlural = ["Bars: ", "Stripes: ", "Bends: ", "Circles: ", "Crosses: ", "Saltires: ", "Quarters: ", "Sun/stars: ", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]


// Input: the JSON object of the country gotten from the database 
function writeCountryInfo(country) {
    if (country.country_name === undefined) {
        document.getElementById("country_flag").style.visibility = "hidden";
        document.getElementById('map_container').style.visibility = "hidden";
        document.getElementById("attributes").innerText = "NOT A VALID COUNTRY!";
        return;
    }

    // console.log(country);
    document.getElementById("country_name").innerText = country.country_name;
    // console.log("flag_images/" + country.tld + ".png");
    document.getElementById("country_flag").src = "../static/flag_images/" + country.tld + ".png";

    let attributesList = document.getElementById("attributes");

    for (let i = 0; i < countryStats.length; i++) {
        // console.log(countryStats[i]);
        if (country[countryStats[i]] !== null) {
            let li = document.createElement('li');
            li.innerText = countryStatsHeaders[i] + country[countryStats[i]];
            attributesList.append(li);
        }
    }

    let colorsList = document.createElement("ul");
    for (let i = 0; i < colors.length; i++) {
        if (country[colors[i]]) {
            let li = document.createElement('li');
            li.innerText = colorHeaders[i];
            colorsList.append(li);
        }
    }

    let colorsListItem = document.createElement('li');
    colorsListItem.innerText = "Colors:";
    colorsListItem.append(colorsList);
    attributesList.append(colorsListItem);


    let symbolsList = document.createElement("ul");
    for (let i = 0; i < symbols.length; i++) {
        if (country[symbols[i]] != 0) {
            let li = document.createElement('li');
            if ((typeof country[symbols[i]] == "boolean") || (country[symbols[i]] == 1)) {
                li.innerText = symbolHeadersSingular[i];
            } else {
                li.innerText = symbolHeadersPlural[i] + country[symbols[i]];
            }
            symbolsList.append(li);
        }
    }

    let symbolListItem = document.createElement('li');
    symbolListItem.innerText = "Symbols:";
    symbolListItem.append(symbolsList);
    attributesList.append(symbolListItem);
}



/*
 * map-sample-world.js
 * Jeff Ondich
 * 11 November 2020
 *
 * Simple sample using the Datamaps library to show how to incorporate
 * a US map in your project.
 *
 * Datamaps is Copyright (c) 2012 Mark DiMarco
 * https://github.com/markmarkoh/datamaps
 */

function initializeMap(country) {
    let iso = country.iso3;
    // console.log(country.iso3);
    // console.log(country);

    // let countryData = { country.iso3 : {fillColor: '#aa2222'} };
    let countryData = {GBR: {fillColor: '#2222aa'}};
    // console.log(countryData);

    var map = new Datamap({ element: document.getElementById('map_container'),
                            scope: 'world', 
                            projection: 'equirectangular', 
                            done: onMapDone, // once the map is loaded, call this function
                            data: countryData, // here's some data that will be used by the popup template
                            fills: { defaultFill: '#999999' },
                            geographyConfig: {
                                popupOnHover: false, // You can disable the hover popup
                                highlightOnHover: false, // You can disable the color change on hover
                            }
                          });
}

function onMapDone() {
    return;
}