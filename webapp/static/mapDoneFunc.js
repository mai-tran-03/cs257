// To go between the names that are different on Datamap vs. our database. 
const datamapsCountryNames = [
    "United States of America",
    "Republic of the Congo",
    "West Bank", 
    "The Bahamas",
    "Somaliland", // Not in our country data, redirect to Somalia
    "Western Sahara", // We also don't have the Sahrawi Republic in the data
    "Northern Cyprus", // Same lack of data, redirect to home country
    "New Caledonia", // Same lack of data, redirect to home country
    "French Southern and Antarctic Lands", 
    "East Timor",
    "French Guiana"
];

const databaseCountryNames = [
    "United States",
    "Congo",
    "Palestine", 
    "Bahamas",
    "Somalia",
    "Morocco",
    "Turkey", 
    "France", 
    "France", 
    "Timor Leste",
    "France"
];


// Function to be used for mapDone that is called when a country in a map is
// clicked. 
export function clickableCountries(dataMap, baseURL) {
    dataMap.svg.selectAll(".datamaps-subunit").on("click", function (geography, data) {
        let countryName = geography.properties.name;
        let countryNameIndex = datamapsCountryNames.indexOf(countryName);

        if (countryNameIndex > -1) {
            countryName = databaseCountryNames[countryNameIndex];
        }

        window.location.assign(baseURL + "/country/" + countryName);
    });
}