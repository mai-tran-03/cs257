// Returns the base URL of the API, and can add endpoint components.
export function getBaseURL() {
    let baseURL = window.location.protocol
        + "//" + window.location.hostname
        + ":" + window.location.port;
    return baseURL;
}
