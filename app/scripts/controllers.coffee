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
  'localStorageService'

($scope, $location, $resource, $rootScope, $routeParams, $http, localStorageService) ->

  # Uses the url to determine if the selected
  # menu item should have the class active.
  $scope.$location = $location
  $scope.$watch('$location.path()', (path) ->
    $scope.activeNavId = path || '/'
  )

  $scope.selected = null
  $scope.tab = ''
  $scope.selectedCategories = []
  # $scope.category = {
  #   "available": []
  # }
  # localStorageService.clearAll()
  $http.get('_categories.json').success (data) ->
    $scope.categories = data 
    angular.forEach(data.category, (value, key) ->
      # console.log(localStorageService.get(value.slug), 'pour', value.slug, typeof localStorageService.get(value.slug))

      if typeof localStorageService.get(value.slug) == "string"
        # console.log('cest un string')
        if localStorageService.get(value.slug) != 'false'
          $scope.selectedCategories[ value.slug ] = {'selected': true} 
        else 
          $scope.selectedCategories[ value.slug ] = {'selected': false}
      else
        $scope.selectedCategories[ value.slug ] = {'selected': false}

    )

    # localStorageService.set('categories','mop')
    
  $scope.select = (value, index) ->
    $scope.tab = value
    $scope.selected = index


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
  $http.get('2015_2.json').success (data) ->
    $scope.stacks = data

])

.controller('sidebarCtrl', [
  '$scope','$http', '$location', 'localStorageService'

($scope, $http, $location,localStorageService) ->



  $scope.isActive = (item) ->
    if (item.path == $location.path())
      return true
    return false



  $scope.toggleSelection = (slug) ->

    # console.log($scope.selectedCategories[slug].selected)

    if $scope.selectedCategories[ slug ].selected == false
      $scope.selectedCategories[ slug ].selected = true
    else
      $scope.selectedCategories[ slug ].selected = false
    # myJsonString = JSON.stringify($scope.selectedCategories)
    # console.log(myJsonString)
    # console.log(slug,$scope.selectedCategories[ slug ].selected)
    localStorageService.set(slug,$scope.selectedCategories[ slug ].selected)
    # console.log(localStorageService.get(slug))
])

