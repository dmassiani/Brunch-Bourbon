'use strict'

### Controllers ###

angular.module('app.controllers', [])

.controller('AppCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'
  '$routeParams'
  '$http'

($scope, $location, $resource, $rootScope, $routeParams, $http) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  # getClass compares the current url with the id.
  # If the current url starts with the id it returns 'active'
  # otherwise it will return '' an empty string. E.g.
  #
  #   # current url = '/products/1'
  #   getClass('/products') # returns 'active'
  #   getClass('/orders') # returns ''
  #
  $scope.getClass = (id) ->
    if $scope.activeNavId.substring(0, id.length) == id
      return 'active'
    else
      return ''

  $http.get('_categories.json').success (data) ->
    $scope.categories = data
  $scope.changeTab = (value) ->
    console.log(value)
    $scope.tab = value
])

.controller('MyCtrl1', [
  '$scope'

($scope) ->
  $scope.onePlusOne = 2
])

.controller('MyCtrl2', [
  '$scope'

($scope) ->
  $scope
])

.controller('TodoCtrl', [
  '$scope'
  '$http'
  '$routeParams'
  '$location'

($scope, $http, $routeParams, $location) ->
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path
  )
  $http.get('2015.json').success (data) ->
    $scope.stacks = data
])

.controller('sidebarCtrl', [
  '$scope','$http'

($scope, $http) ->

  $http.get('_categories.json').success (data) ->
    $scope.categories = data

  $scope.test = 'trude'

])

