# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./services
#= require_tree ./controllers
#= require_tree ./directives
#= require_tree ./filters

ExerciseApp = angular.module("ExerciseApp", ['ngRoute'])

ExerciseApp.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/exercises/new', { templateUrl: '../assets/exerciseNew.html', controller: 'ExerciseNewCtrl'})
  $routeProvider.when('/exercises/:exerciseId', { templateUrl: '../assets/exerciseShow.html', controller: 'ExerciseShowCtrl'})
  $routeProvider.when('/exercises/:exerciseId/edit', { templateUrl: '../assets/exerciseEdit.html', controller: 'ExerciseEditCtrl'})

  $routeProvider.otherwise({ templateUrl: '../assets/exerciseIndex.html', controller: 'ExerciseIndexCtrl'})
])

ExerciseApp.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
