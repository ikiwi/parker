var app = angular.module('parker', ['ui.router']);

app.config(function($stateProvider, $urlRouterProvider) {
  //
  // For any unmatched url, redirect to /
  $urlRouterProvider.otherwise("/");
  //
  // Now set up the states
  $stateProvider
    .state('home', {
      url: "",
      templateUrl: "templates/home.html",
      controller: 'homeCtrl'
    })

});

app.controller('homeCtrl', function ($scope, $http) {
  $http.get("/spots").then(
    function (success) {
      console.log(success);
      $scope.totalAvailable = success.data.total;
    },
    function (error) {
      console.log(error);
    }
  );

  $http.get("/targets").then(
    function (success) {
      console.log(success);
      $scope.totalLooking = success.data.total;
    },
    function (error) {
      console.log(error);
    }
  );

  $scope.releaseSpot = function() {
  	navigator.geolocation.getCurrentPosition(setAvailable);
  }
  $scope.findSpot = function() {
  	navigator.geolocation.getCurrentPosition(setLooking);
  }

  function setAvailable(location) {
  	console.log(location)
	$http.post("/spots", {user_id: 1, latitude: location.coords.latitude, longitude: location.coords.longitude}).then(
		function (success) {
		  console.log(success);
		  $scope.totalAvailable = success.data.total;
		},
		function (error) {
		  console.log(error);
		}
	);
  }

  function setLooking(location) {
  	console.log(location)
	$http.post("/targets", {user_id: 1, latitude: location.coords.latitude, longitude: location.coords.longitude}).then(
		function (success) {
		  console.log(success);
		  $scope.totalLooking = success.data.total;
		},
		function (error) {
		  console.log(error);
		}
	);
  }

});