app.factory("AllSkills", function($resource) {
    return $resource("/rest/skills/all", {}, {query: {isArray:false}});
});

