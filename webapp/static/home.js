/*
To do

- have hover pop up say good text (yellow/brown not yellow_brown)
- stretch goal: have way to limit search by continent
- make everything camel case in js and html 
- add comments
- clean up 
- make the continent dropdown pretty 
- standardize between " and ' 
- rescale continents on home page 
- make style of continent dropdown match 
*/



// Set up the event listeners for the search bar after loading
window.addEventListener("load", function () {

    // link home button
    document.getElementById("home").href = getBaseURL();

    let searchElement = document.getElementById("search_bar");
    searchElement.addEventListener("input", filterResults);

    searchElement.addEventListener("mouseover", function () {
        document.getElementById("search_countries").style.visibility = "visible";
    });

    populateDropBar();
    let map = drawMap({}, null);

    document.getElementById("submit").addEventListener("click", function () {
        searchAttributes(map);
    });
});

function searchAttributes(map) {
    let attributes = makeGetParamAttributes();
    let getParams = attributes["getParams"];
    let continent = attributes["continent"];
    console.log(getParams);
    console.log(continent);

    document.getElementById('map_container').remove();

    let newMap = document.createElement("div");
    newMap.id = "map_container";
    newMap.className = "center";
    document.getElementById("mapDiv").append(newMap);

    if (getParams === null) {
        redrawMap({}, map, continent);
        return;
    }

    fetch(getParams, { method: 'get' })
        .then((response) => response.json())
        .then(function (result) {
            redrawMap(result, map, continent);
        })
        .catch(function (error) {
            console.log(error);
        });
}

// maybe rename this function....
function makeGetParamAttributes() {
    // make the get parameters with the flag attributes
    let attributeBoxes = document.getElementById("attributeBoxes");
    let getParams = getBaseURL() + '/api/countries?';

    let noAttribute = true;
    let attributes = {};

    let continents = document.getElementById("continents");
    if (continents.value !== "All") {
        getParams += "continent=" + continents.value + "&";
        attributes["continent"] = continents.value;
    } else {
        attributes["continent"] = null;
    }

    let checkBoxes = attributeBoxes.querySelectorAll("input");
    for (let i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i]; 

        if (checkBox.checked) { 
            noAttribute = false;
            getParams += checkBox.id + '=1&';
        }
    }
    if (noAttribute) {
        attributes["getParams"] = null;
        return attributes;
    }

    // remove extra & from end or if ? then remove that
    getParams = getParams.substring(0, getParams.length-1);

    attributes["getParams"] = getParams;
    return attributes;
}

// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp
function filterResults() {
    let input = document.getElementById("search_bar");
    let searchText = input.value.toUpperCase();
    let ul = document.getElementById("search_countries");
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

            let ul = document.getElementById("search_countries");

            let baseURL = getBaseURL();

            let liNone = document.createElement('li');
            let aNone = document.createElement('a');
            aNone.href = baseURL; 
            aNone.textContent = "Home (no country)";
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

function redrawMap(countries, map, continent) {
    console.log("redraw map!");

    let countriesData = {};
    // console.log(countries);

    for (let i = 0; i < countries.length; i++) {
        let country = countries[i];
        let data = {};

        for (const [key, value] of Object.entries(country)) {
            if (key === "country_name" || key === "iso3") {
                continue;
            }
            data[key] = value;
        }
        data['fillColor'] = '#f54242';

        countriesData[country.iso3] = data;
    }
    drawMap(countriesData, continent);
}

function drawMap(countriesData, continent) {

    let map = new Datamap({ element: document.getElementById('map_container'),
                            scope: 'world', 
                            projection: 'equirectangular',
                            setProjection: function(element) {
                                return continentProjection(element, continent);
                            }, 
                            done: function() {}, 
                            data: countriesData,
                            fills: { defaultFill: '#999999' },
                            geographyConfig: {
                                highlightOnHover: false, 
                                hideAntarctica: false,
                                popupTemplate: hoverPopup
                            }
                          });
    return map;
}

function hoverPopup(geography, data) {
    console.log(data);
    let template = '<div class="hoverpopup"><strong>' + geography.properties.name + '</strong><br>\n';

    for (const [key, value] of Object.entries(data)) {
        if (key === "country_name" || key === "iso3" || key === "fillColor") {
            continue;
        }
        template += '<strong>' + key + ':</strong> ' + value + '<br>\n';
    }
    template +='</div>';

    return template;
}

function continentProjection(element, name) {
    if (name === "Africa") {
        let projection = d3.geo.equirectangular()
            .center([23, 2])
            .rotate([4.4, 0])
            .scale(450)
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
            .scale(190)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return {path: path, projection: projection};
    }
}
