app.factory("AllProjects", function($resource) {
    return $resource("/rest/projects/all");
});