angular.module("FC.Services", ["ngResource"])

.service("Outgoing", ["$resource", function($resource) {
  var Outgoing = $resource("http://localhost:4567/outgoing", {}, {
    get: { isArray: true }
  });

  Outgoing.findByTime = function(timestamp, callback) {
    return this.get({ timestamp: timestamp }, callback);
  };

  return Outgoing;
}]);
