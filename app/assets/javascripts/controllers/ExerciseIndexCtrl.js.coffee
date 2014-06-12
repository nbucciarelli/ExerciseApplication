@ExerciseIndexCtrl = ($scope, $location, $http, exerciseData) ->
  $scope.title = "Exercises"
  $scope.data = exerciseData.data

  exerciseData.loadExercises(null)

  $scope.viewExercise = (exerciseId) ->
    $location.url('/exercises/' + exerciseId)

  $scope.navNewExercise = ->
    $location.url('/exercises/new')

@ExerciseIndexCtrl.$inject = ['$scope', '$location', '$http', 'exerciseData']