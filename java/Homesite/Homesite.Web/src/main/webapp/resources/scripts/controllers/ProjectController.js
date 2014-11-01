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
