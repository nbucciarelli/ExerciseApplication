@ExerciseIndexCtrl = ($scope, $location, $http, exerciseData, muscleData) ->
  $scope.title = "Exercises"
  $scope.exercises = exerciseData.data
  $scope.muscles = muscleData.data
  $scope.searchText = ''

  exerciseData.loadExercises(null)
  muscleData.loadMuscles(null)

  $scope.viewExercise = (exerciseId) ->
    $location.url('/exercises/' + exerciseId)

  $scope.navNewExercise = ->
    $location.url('/exercises/new')

@ExerciseIndexCtrl.$inject = ['$scope', '$location', '$http', 'exerciseData', 'muscleData']