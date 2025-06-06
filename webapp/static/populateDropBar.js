import { getBaseURL } from "./getBaseUrl.js";

// Fetches a list of all countries to fill in the country search dropdown.
export function populateDropBar() {
    let baseURL = getBaseURL();

    fetch(baseURL + "/api/countries", { method: "get" })
        .then((response) => response.json())
        .then(function (result) {
            result.sort(function (a, b) {
                return a.country_name.localeCompare(b.country_name);
            });

            let ul = document.getElementById("searchCountries");

            // For each country, makes a new list item <li> and adds it to the
            // dropdown list, sets the link <a> with the country name.
            for (let i = 0; i < result.length; i++) {
                const country = result[i];
                let li = document.createElement("li");
                let a = document.createElement("a");

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
