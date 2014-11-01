app.controller('ContentController', function($scope, AllGlobalContent){
    AllGlobalContent.query(function(data){
        $scope.introText = data.introText;
    });
});
