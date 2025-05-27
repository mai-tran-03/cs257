// TO DO:
// re-format the info from list to a beautiful table
// add comments to these functions
// fix the dropdown
// move oceania projection a little right so we can see fiji




// Set up the event listeners for the search bar after loading
window.addEventListener("load", function () {
    console.log('loading......')
    let searchElement = document.getElementById("searchBar");
    searchElement.addEventListener("input", filterResults);

    searchElement.addEventListener("mouseover", function () {
        document.getElementById("searchCountries").style.visibility = "visible";
    });

    document.getElementById("home").href = getBaseURL();

    populateDropBar();
    getCountryFromAPI(getNameFromUrl());
});

// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp
function filterResults() {
    let input = document.getElementById("searchBar");
    let searchText = input.value.toUpperCase();
    let ul = document.getElementById("searchCountries");
    let li = ul.getElementsByTagName("li");

    for (let i = 0; i < li.length; i++) {
        let a = li[i].querySelector("a");
        let textValue = a.textContent || a.innerText;
        if (textValue.toUpperCase().indexOf(searchText) > -1) {
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

            let ul = document.getElementById("searchCountries");

            let baseURL = getBaseURL();

            let liNone = document.createElement('li');
            let aNone = document.createElement('a');
            aNone.href = baseURL; 
            aNone.textContent = "None";
            liNone.append(aNone);
            ul.append(liNone);

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


const countryStats = ["other_names", "area", "population", "continent_name", "main_hue"];
const countryStatsHeaders = ["Other names: ", "Area (sq km): ", "Population: ", "Continent: ", "Main hue: "];
const colors = ["red", "green", "blue", "gold_yellow", "white", "black_grey", "orange_brown", "pink_purple"];
const colorHeaders = ["Red", "Green", "Blue", "Gold/yellow", "White", "Black/grey", "Orange/brown", "Pink/purple"];
const symbols = ["bars", "stripes", "bends", "circles", "crosses", "saltires", "quarters", "sun_stars", "crescent_moon", "triangle", "inanimate_image", "animate_image", "text", "crest_emblem", "border", "trapezoid"]
const symbolHeadersSingular = ["Bar: 1", "Stripe: 1", "Bend: 1", "Circle: 1", "Cross: 1", "Saltire: 1", "Quarter: 1", "Sun/star: 1", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]
const symbolHeadersPlural = ["Bars: ", "Stripes: ", "Bends: ", "Circles: ", "Crosses: ", "Saltires: ", "Quarters: ", "Sun/stars: ", "Crescent moon(s)", "Triangle(s)", "Inanimate images(s)", "Animate images(s)", "Text", "Crest/emblems(s)", "Border", "Trapezoids(s)"]


// Input: the JSON object of the country gotten from the database 
function writeCountryInfo(country) {
    if (country.country_name === undefined) {
        document.getElementById("countryFlag").style.visibility = "hidden";
        document.getElementById('mapContainer').style.visibility = "hidden";
        document.getElementById("attributes").innerText = "NOT A VALID COUNTRY!";
        return;
    }

    // console.log(country);
    document.getElementById("countryName").innerText = country.country_name;
    // console.log("flag_images/" + country.tld + ".png");
    document.getElementById("countryFlag").src = "../static/flag_images/" + country.tld + ".png";

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
 * Datamaps is Copyright (c) 2012 Mark DiMarco
 * https://github.com/markmarkoh/datamaps
 */

function initializeMap(country) {
    let countryData = {};
    let continentName = country.continent_name;
    countryData[country.iso3] = {fillColor: '#f54242'};

    let map = new Datamap({ element: document.getElementById('mapContainer'),
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
}

function continentProjection(element, name) {
    if (name === "Africa") {
        let projection = d3.geo.equirectangular()
            .center([23, 2])
            .rotate([4.4, 0])
            .scale(500)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (name === "Asia") {
        let projection = d3.geo.equirectangular()
            .center([90, 35])
            .rotate([4, 0])
            .scale(400)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (name === "Europe") {
        let projection = d3.geo.equirectangular()
            .center([23, 50])
            .rotate([5, 0])
            .scale(800)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (name === "North America") {
        let projection = d3.geo.equirectangular()
            .center([-100, 40])
            .rotate([5, 0])
            .scale(450)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (name === "Oceania") {
        let projection = d3.geo.equirectangular()
            .center([135, -20])
            .rotate([5, 0])
            .scale(600)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (name === "South America") {
        let projection = d3.geo.equirectangular()
            .center([-60, -20])
            .rotate([5, 0])
            .scale(515)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else {
        let projection = d3.geo.equirectangular()
            .center([0, 0])
            .rotate([0, 0])
            .scale(225)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    }
}


