// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function setAvailable(location) {
	console.log(location)

	var xhr = new XMLHttpRequest();
	xhr.open('POST', "/spots", false);
	xhr.send();

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