'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'ngRoute'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
  'partials'
  'LocalStorageModule'
])

App.config([
  '$routeProvider'
  '$locationProvider'
  'localStorageServiceProvider'

($routeProvider, $locationProvider, localStorageServiceProvider, config) ->

  $routeProvider

    .when('/', {templateUrl: '/partials/stacks.html'})

    # Catch all
    .otherwise({redirectTo: '/'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(true)
  localStorageServiceProvider.setPrefix('stackterest')
])
