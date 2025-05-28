// On window load, set up the home button, search drop down, the map, and the
// listener for the submit button. 
window.addEventListener("load", function () {

    // link home button
    document.getElementById("home").href = getBaseURL();


    // set up search bar drop down
    let searchElement = document.getElementById("searchBar");
    searchElement.addEventListener("input", filterResults);

    let searchCountriesList = document.getElementById("searchCountries");

    searchElement.addEventListener("mouseover", function () {
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

    // blank map 
    let map = drawMap({}, null);

    document.getElementById("submit").addEventListener("click", function () {
        searchAttributes(map);
    });
});

// After clicking submit, all of the attributes that are clicked are found,
// the information is fetched, the old map is deleted, the new one is drawn
function searchAttributes(map) {
    let attributes = makeGetParams();
    let getParams = attributes["getParams"];
    let continent = attributes["continent"];

    // delete the old map (hover popups are broken if this does not happen)
    document.getElementById("mapContainer").remove();

    // create a new map with the same ID as the old one
    let newMap = document.createElement("div");
    newMap.id = "mapContainer";
    newMap.className = "center";
    document.getElementById("mapDiv").append(newMap);

    // If none of the attributes were clicked, redraw the map blank. If a 
    // continent was chosen, then the map will display that continent. 
    if (getParams === null) {
        redrawMap({}, map, continent);
        return;
    }

    // Fetch the list of countries that fall under those attributes,
    // redraw the map with them, taking into account what continent to 
    // display. 
    fetch(getParams, { method: 'get' })
        .then((response) => response.json())
        .then(function (result) {
            let newMapData = getMapData(result, continent);
            drawMap(newMapData, continent);
        })
        .catch(function (error) {
            console.log(error);
        });
}

// Makes the URL with the get parameters based off of the clicked checkboxes
// of the flag attributes. Returns an object with the getParams as a URL
// to be used and returns the continent (so that we don't need to find it
// later from the get parameters)
function makeGetParams() {
    // make the get parameters with the flag attributes
    let attributeBoxes = document.getElementById("attributeBoxes");
    let getParams = getBaseURL() + '/api/countries?';

    let attributes = {};

    let continents = document.getElementById("continents");
    if (continents.value !== "All") {
        getParams += "continent=" + continents.value + "&";
        attributes["continent"] = continents.value;
    } else {
        attributes["continent"] = null;
    }

    let noAttribute = true;

    let checkBoxes = attributeBoxes.querySelectorAll("input");
    for (let i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i]; 

        if (checkBox.checked) { 
            noAttribute = false;
            getParams += checkBox.id + '=1&';
        }
    }

    // in order to avoid substringing an empty string, if nothing was added
    // then return null
    if (noAttribute) {
        attributes["getParams"] = null;
        return attributes;
    }

    // remove extra & from end
    getParams = getParams.substring(0, getParams.length-1);

    attributes["getParams"] = getParams;
    return attributes;
}

// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp
// Cuts down the dropdown list as strings are searched.
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


// Returns the base URL of the API, which endpoint components can be added to
function getBaseURL() {
    let baseURL = window.location.protocol
        + '//' + window.location.hostname
        + ':' + window.location.port;
    return baseURL;
}

// Fetch list of all countries to fill in the country search dropdown
function populateDropBar() {
    let baseURL = getBaseURL();

    fetch(baseURL + '/api/countries', { method: 'get' })
        .then((response) => response.json())
        .then(function (result) {
            console.log(result);
            result.sort(function (a, b) {
                return a.country_name.localeCompare(b.country_name);
            });

            let ul = document.getElementById("searchCountries");

            // for each country, make a new list item <li> and add it to the
            // dropdown list, set the link <a> with the country name
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

// Set the data for the new map by applying per each country the attributes
// and their values and making each selected country be colored. 
function getMapData(countries, continent) {
    let countriesData = {};

    // for every country in the list of selected countries:
    for (let i = 0; i < countries.length; i++) {
        let country = countries[i];
        let data = {};

        // for every attribute (key) and its amount (value), add it to the
        // map data for that country
        for (const [key, value] of Object.entries(country)) {
            if (key === "iso3") {
                continue;
            }
            data[key] = value;
        }
        data['fillColor'] = '#f54242';

        countriesData[country.iso3] = data;
    }
    return countriesData;
}

// To go between the names that are different on Datamap vs. 
// our database. 
const datamapsCountryNames = [
    "United States of America", 
    "Republic of the Congo",
    "West Bank"
];

const databaseCountryNames = [
    "United States",
    "Congo",
    "Palestine"
];


/*
 * Datamaps is Copyright (c) 2012 Mark DiMarco
 * https://github.com/markmarkoh/datamaps
 */

// Draw a map of the inputted continent (or the world if null) while coloring in
// the selected countries. countriesData also includes the attributes information
// which is used in the hover pop ups. 
function drawMap(countriesData, continent) {
    new Datamap({ element: document.getElementById('mapContainer'),
                    scope: 'world', 
                    projection: 'equirectangular',
                    setProjection: function(element) {
                        return continentProjection(element, continent);
                    }, 
                    done: function(datamap) {
                        datamap.svg.selectAll('.datamaps-subunit').on('click', function(geography, data) {
                            let countryName = geography.properties.name;
                            let countryNameIndex = datamapsCountryNames.indexOf(countryName);

                            if (countryNameIndex > -1) {
                                countryName = databaseCountryNames[countryNameIndex];
                            }

                            window.location.assign(getBaseURL() + "/country/" + countryName);
                        });
                    },
                    data: countriesData,
                    fills: { defaultFill: '#999999' },
                    geographyConfig: {
                        highlightOnHover: false, 
                        hideAntarctica: false,
                        popupTemplate: hoverPopup
                    }
                });
}

// Object with attribute names and their better formatted versions in order to
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
    trapazoid: "Trapazoid: "
};

// Returns html div for the hover pop up that appears in the world map per each
// country. Inputs the data of the entire map and geography of the country highlighed
// because the library needs geography to be inputted. The hover pop up has the 
// attributes well formatted with their data. 
function hoverPopup(geography, data) {
    let template = '<div class = "hoverpopup">';

    template += '<img class="hoverpopupFlag" src="../static/flag_images/' + data.tld + '.png">'

    template += '<strong> ' + data.country_name + '</strong><br>\n';

    for (const [key, value] of Object.entries(data)) {
        if (key === "country_name" || key === "iso3" || key === "fillColor" || key === "tld") {
            continue;
        }
        template += '<strong>' + formattedAttributes[key] + '</strong> ' + value + '<br>\n';
    }
    template +='</div>';

    return template;
}

// Given a continent, a different projection will be returned in order to zoom in
// to that continent. element is the name of the map itself and the variable must
// be named that because of the library. If a non-valid continent name is given,
// or null, then the world projection is returned.
function continentProjection(element, continentName) {
    if (continentName === "Africa") {
        let projection = d3.geo.equirectangular()
            .center([23, 2])
            .rotate([4.4, 0])
            .scale(450)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (continentName === "Asia") {
        let projection = d3.geo.equirectangular()
            .center([90, 35])
            .rotate([4, 0])
            .scale(400)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (continentName === "Europe") {
        let projection = d3.geo.equirectangular()
            .center([23, 50])
            .rotate([5, 0])
            .scale(800)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (continentName === "North America") {
        let projection = d3.geo.equirectangular()
            .center([-100, 40])
            .rotate([5, 0])
            .scale(450)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (continentName === "Oceania") {
        let projection = d3.geo.equirectangular()
            .center([135, -20])
            .rotate([5, 0])
            .scale(600)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    } else if (continentName === "South America") {
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
            .scale(190)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    }
}
