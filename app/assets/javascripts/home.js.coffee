# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require_self
#= require_tree ./Controllers/home

@tttWebApp = angular.module('tttWebApp',['ngRoute'])

@tttWebApp.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeIndexCtrl'
    })])