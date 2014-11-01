app.factory('AllGlobalContent', ['$resource', function($resource) {
    return $resource('rest/globalcontent/all', {}, { query: { isArray: false }});
}]);
