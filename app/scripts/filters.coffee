'use strict'

### Filters ###

angular.module('app.filters', [])

.filter('interpolate', [
  'version',

(version) ->
  (text) ->
    String(text).replace(/\%VERSION\%/mg, version)
])

.filter('reverse', [
	() ->
		(items) ->
			items.slice().reverse() if typeof items != "undefined"
])