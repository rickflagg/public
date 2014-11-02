app.controller('SkillsController', function($scope, AllSkills){
    AllSkills.query(function(data){
        $scope.skills = data;
        $scope.isCollapsed = true;
    });
});
