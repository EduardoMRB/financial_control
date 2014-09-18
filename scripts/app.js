var app = angular.module("financialControl", [
    "ngResource", 
    "ngRoute",
    "FC.Controllers",
    "FC.Services"
])
.config(function($httpProvider) {
  $httpProvider.defaults.useXDomain = true;

  delete $httpProvider.defaults.headers.common["X-Requested-With"];
});
