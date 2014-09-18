angular.module("FC.Controllers", [])

  .controller("ListCtrl", ["$scope", "Outgoing", function($scope, Outgoing) {
    function currentTimestampInSeconds() {
      return Date.now() / 1000;
    }

    function refreshOutgoings() {
      Outgoing.findByTime(currentTimestampInSeconds(), function(outgoings) {
        $scope.outgoings = outgoings;
      });
    }

    $scope.add = function() {
      var outgoing = new Outgoing({
        date: currentTimestampInSeconds(),
        description: $scope.description,
        payment_method: $scope.method
      });

      outgoing.$save(function() {
        refreshOutgoings();
      });
    };

    refreshOutgoings();
  }]);
