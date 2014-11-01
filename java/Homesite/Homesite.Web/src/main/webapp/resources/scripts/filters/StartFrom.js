app.filter('startFrom', function() {
    return function(input, start) {
        if(typeof start != 'undefined' && typeof input != 'undefined'){
            start = parseInt(start);
            return input.slice(start);
        };
    }
});
