console.log('Loaded, bro');

dinrApp = angular.module('dinrApp', []);

dinrApp.controller('DinrCtrl', function($scope, $http) {
  $scope.restaurants = [];
  
  $scope.search = function(term) {
    $scope.searchTerm = term;
    $scope.fetch();
  }
  $scope.getRestaurants = function(data) {
    $scope.restaurants = data;
    if ($scope.searchTerm) { $scope.searchTerm = '' };
  };
  $scope.getSingleRestaurant = function(data) {
    console.log(data);
    $scope.current = data;
    if ($scope.restaurantId) { $scope.restaurantId = ''};
  }
  
  $scope.fetch = function() {
    if ($scope.searchTerm) {
      $http({method: 'GET', url: '/api/restaurants/search?zip_or_name=' + $scope.searchTerm}).success($scope.getRestaurants);
    } 
    else if ($scope.restaurantId) {
      $http({method: 'GET', url: '/api/restaurants/' + $scope.restaurantId}).success($scope.getSingleRestaurant);
    }else {
      $http({method: 'GET', url: '/api/restaurants'}).success($scope.getRestaurants);
    } 
  }
  
  $scope.showModal = function(model) {
    console.log(model)
    $scope.restaurantId = model.id;
    $scope.fetch()
  }

  // Initial fetch 
  $scope.fetch();

});