@ExerciseShowCtrl = ($scope, $location, $routeParams, exerciseData, $q) ->
  $scope.data = 
    exerciseData: exerciseData.data
    currentExercise:
      name: "Loading..."
      muscle: ""
      exercise_type: ""
      difficulty: ""

  $scope.data.exerciseId = $routeParams.exerciseId

  $scope.returnBack = ->
    $location.url('/')

  $scope.editExercise = ->
    $location.url("/exercises/#{$scope.data.exerciseId}/edit" )

  $scope.deleteExercise = ->
    exerciseData.deleteExercise($scope.data.exerciseId)
    $location.url('/')

  $scope.prepExerciseData = ->
    exercise = _.findWhere(exerciseData.data.exercises, { id: parseInt($scope.data.exerciseId)})
    $scope.data.currentExercise.name = exercise.name
    $scope.data.currentExercise.muscle = exercise.muscle
    $scope.data.currentExercise.exercise_type = exercise.exercise_type
    $scope.data.currentExercise.difficulty = exercise.difficulty

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepExerciseData)
  exerciseData.loadExercises(@deferred)

@ExerciseShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'exerciseData', '$q']