(function(){

  angular.module("app").controller("sharks_ctrl", function($scope, $http){

    $scope.setup = function(){
      $http.get("/v1/sharks.json").then(function(response) {
        $scope.sharks = response.data;
        for (i = 0; i < $scope.sharks.length; i++){
          shark = $scope.sharks[i];
          shark.editStatus = false;
        };
      });
    };

    $scope.toggleDetails = function(shark){
      shark.displayDetails = !shark.displayDetails;

    };


    $scope.sortOrder = function(attribute){
      if (attribute != $scope.orderAttribute){
        $scope.descending - false;
      } else {
        $scope.descending = !$scope.descending;
      };
      $scope.orderAttribute = attribute;
    };


    $scope.master = {};

    $scope.addShark = function(newShark){
      $scope.master = angular.copy(newShark);
      $http.post("/v1/sharks.json", $scope.master).then(function(response){

        $scope.sharks.push($scope.master);
        $scope.newShark = {};

      }, function(error) {
        
        $scope.errors = error.data.errors;
      
      });
            
    }

    $scope.reset = function(){
      var pushableShark = angular.copy($scope.master)
    };

    $scope.reset();


    $scope.toggleEdit = function(shark){
      shark.editStatus = !shark.editStatus;
    };

    $scope.editShark = function(shark){
      var index = $scope.sharks.indexOf(shark)
      $http.patch("/v1/sharks/" + shark.id + ".json", shark).then(function(response){
        $scope.sharks.splice(index, 1, shark);
        shark.editStatus = !shark.editStatus;
      }, function(error){
        $scope.sharkErrors = error.data.errors;
      })
    }

    $scope.deleteShark = function(shark){
      var index = $scope.sharks.indexOf(shark)
      $http.delete("/v1/sharks/" + shark.id + ".json").then(function(response){
          console.log("Shark deleted!")
          $scope.sharks.splice(index, 1)
      })
    }

    window.scope = $scope;

  });
}());