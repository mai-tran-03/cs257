// Given a continent, returns a different projection to zoom in to that continent. 
// element is the name of the map itself and the variable  must be named required 
// by the library. If a non-valid continent name is given, or null, then returns
// the world projection.
export function projectContinent(element, name) {
    if (name === "Africa") {
        let projection = d3.geo.equirectangular()
            .center([23, 2])
            .rotate([4.4, 0])
            .scale(300)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "Asia") {
        let projection = d3.geo.equirectangular()
            .center([100, 30])
            .rotate([4, 0])
            .scale(300)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "Europe") {
        let projection = d3.geo.equirectangular()
            .center([23, 50])
            .rotate([5, 0])
            .scale(550)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "North America") {
        let projection = d3.geo.equirectangular()
            .center([-100, 40])
            .rotate([5, 0])
            .scale(390)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "Oceania") {
        let projection = d3.geo.equirectangular()
            .center([135, -20])
            .rotate([5, 0])
            .scale(400)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else if (name === "South America") {
        let projection = d3.geo.equirectangular()
            .center([-60, -20])
            .rotate([5, 0])
            .scale(295)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    } else { // the world
        let projection = d3.geo.equirectangular()
            .center([0, 0])
            .rotate([0, 0])
            .scale(145)
            .translate([element.offsetWidth / 2, element.offsetHeight / 2]);
        let path = d3.geo.path()
            .projection(projection);

        return { path: path, projection: projection };
    }
}
