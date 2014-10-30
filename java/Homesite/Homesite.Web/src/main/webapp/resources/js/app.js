/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/21/14
 * Time: 10:54 AM
 * To change this template use File | Settings | File Templates.
 */

var app = angular.module('homesite', ['ngResource']);


app.factory("AllProjects", function($resource) {
    return $resource("/rest/projects/all");
});

app.factory('AllGlobalContent', ['$resource', function($resource) {
    return $resource('rest/globalcontent/all', {}, { query: { isArray: false }});
}]);

app.factory("AllSkills", function($resource) {
    return $resource("/rest/skills/all", {}, {query: {isArray:false}});
});

app.factory("AllLinks", function($resource) {
    return $resource("/rest/links/all", {}, {query: {isArray:false}});
});

app.factory("AllLinksByCategory", function($resource) {
    return $resource("/rest/links/categories", {}, {query: {isArray:true}});
});


app.controller('ProjectController', function ($scope, AllProjects) {

    AllProjects.query(function(data) {

        $scope.currentPage = 0;
        $scope.pageSize = 1;

        $scope.projects = data;

        $scope.numberOfPages=function(){
            return Math.ceil($scope.projects.length/$scope.pageSize);
        }
    });

});

app.controller('GlobalContentController', function($scope, AllGlobalContent){

    AllGlobalContent.query(function(data){
        $scope.introText = data.introText;
    });

});

app.controller('SkillsController', function($scope, AllSkills){

    AllSkills.query(function(data){
        $scope.skills = data;
    });


});

app.controller('LinksController', function($scope, AllLinksByCategory){

    AllLinksByCategory.query(function(data){

        $scope.isCollapsed = true;
        $scope.columnCount = 3;

        $scope.rows = [];
        var columnValues = new Array();

        if (data != undefined && data.length > 0) {
            for (var i = 0; i < data.length; i++) {

                columnValues.push(data[i]);

                if (((i+1) % $scope.columnCount) == 0 && (i > 0)) {
                    $scope.rows.push(columnValues);
                    columnValues = new Array();
                }

            }
        }

    });

});

//We already have a limitTo filter built-in to angular,
//let's make a startFrom filter
app.filter('startFrom', function() {
    return function(input, start) {
        if(typeof start != 'undefined' && typeof input != 'undefined'){
            start = parseInt(start);
            return input.slice(start);
        };
    }
});
