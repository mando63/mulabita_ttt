@tttWebApp.controller 'HomeIndexCtrl',['$scope','$location', '$http' ($scope,$location,$http)->
  $scope.title = "Tic Tac Toe with Bot"
  $scope.data =
    game: [{title: 'Game is loading'}]
  reset_grid = ->
    $scope.grid = [
    [ { value: '-' }, { value: '-' }, { value: '-' } ],
      [ { value: '-' }, { value: '-' }, { value: '-' } ],
      [ { value: '-' }, { value: '-' }, { value: '-' } ]
    ]

  reset_grid()
]