app.factory("AllLinks", function($resource) {
    return $resource("/rest/links/all", {}, {query: {isArray:false}});
});

app.factory("AllLinksByCategory", function($resource) {
    return $resource("/rest/links/categories", {}, {query: {isArray:true}});
});
