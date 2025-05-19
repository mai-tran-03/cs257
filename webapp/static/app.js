// Set up the event listeners for the search bar after loading
window.addEventListener("load", function () {
    console.log('loading......')
    let searchElement = document.getElementById("search_bar");
    searchElement.addEventListener("keyup", filterResults);
    let getData = document.getElementById("get_data");
    getData.addEventListener("click", onGetData);
});

// Returns the base URL of the API, onto which endpoint components can be appended.
function getAPIBaseURL() {
    let baseURL = window.location.protocol
        + '//' + window.location.hostname
        + ':' + window.location.port
        + '/api';
    return baseURL;
}
// Taken from https://www.w3schools.com/howto/howto_js_filter_dropdown.asp
function filterResults() {
    let input = document.getElementById("search_bar");
    let filter = input.value.toUpperCase();
    let ul = document.getElementById("search_countries");
    let li = ul.getElementsByTagName("li");
    for (let i = 0; i < li.length; i++) {
        let a = li[i].getElementsByTagName("a")[0];
        let txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

function onGetData() {
    console.log('clicked-----');
    let url = getAPIBaseURL() + '/countries';

    fetch(url, { method: 'get' })
        .then((response) => response.json())
        .then(function (result) {
            let ul = document.getElementById("search_countries");
            for (let i = 0; i < result.length; i++) {
                let li = document.createElement('li');
                let a = document.createElement('a');
                a.href = "#";
                a.innerText = result[i].country_name;
                li.append(a);
                ul.append(li);
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}