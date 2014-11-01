app.controller('LinkController', function($scope, AllLinksByCategory){

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

