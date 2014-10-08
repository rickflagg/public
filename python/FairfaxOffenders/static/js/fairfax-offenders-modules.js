/**
 * User: Rick Flagg
 * Date: 3/29/14
 * Time: 9:01 AM
 * To change this template use File | Settings | File Templates.
 */

var GeoLocation = (function(Modernizr, geoPosition){

    
    return function getLocation()
    {

        var retval = {};

        if (Modernizr.geolocation) {
            // let's find out where you are!

            var options = {
                enableHighAccuracy: true,
                timeout: 5000,
                maximumAge: 0
            };

            function success(pos) {
                var crd = pos.coords;


                retval = {
                    "latitude": crd.latitude,
                    "longitude": crd.longitude
                }

            };

            function error(err){
                retval = {
                    "latitude": 38.85224450000000,
                    "longitude": -77.30183800000000
                }

            }

            navigator.geolocation.getCurrentPosition(success, error, options);

        } else {
            // no native geolocation support available :(
            // try geoPosition.js or another third-party solution
            if (geoPosition.init()) {
                geoPosition.getCurrentPosition(geoSuccess, geoError);
            }

            function geoSuccess(p) {
                retval = {
                    "latitude": p.coords.latitude,
                    "longitude": p.coords.longitude
                }

            }

            function geoError() {
                retval = {
                    "latitude": 38.85224450000000,
                    "longitude": -77.30183800000000
                }

            }

        }

        return retval;
    }

} (Modernizr, geoPosition));