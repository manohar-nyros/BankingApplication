(function() {
  var angular, root, thisApp;

  root = typeof global !== "undefined" && global !== null ? global : window;

  angular = root.angular;

  thisApp = angular.module("AjsAppClient", ['ui.bootstrap','posts','reviews','ngRoute', 'ngResource','ui.bootstrap','Devise','angular-flash.service', 'angular-flash.flash-alert-directive','ngFileUpload','angularFileUpload']).config([
    '$routeProvider', '$locationProvider','flashProvider', function($routeProvider, $locationProvider,flashProvider) {
      flashProvider.successClassnames.push('alert-success');
      return $routeProvider.
      when('/home', {controller:HomeCtrl,
        templateUrl:'templates/home/home.html'}).
        otherwise({
        redirectTo: "/home"
      });
    }
  ]);

  root.thisApp = thisApp;

}).call(this);
