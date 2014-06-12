@ExerciseEditCtrl = ($scope, $location, exerciseData, $q, $routeParams) ->
  $scope.data = 
    exerciseData: exerciseData.data
    currentExercise:
      name: "Loading..."
      muscle: ""
      exercise_type: ""
      difficulty: ""

  $scope.data.exerciseId = $routeParams.exerciseId

  $scope.formData = 
    editExerciseName: ''
    editExerciseMuscle: ''
    editExerciseExerciseType: ''
    editExerciseDifficulty: ''
    editExerciseId: $routeParams.exerciseId

  $scope.prepExerciseData = ->
    exercise = _.findWhere(exerciseData.data.exercises, { id: parseInt($scope.data.exerciseId)})
    $scope.data.currentExercise.name = exercise.name
    $scope.data.currentExercise.muscle = exercise.muscle
    $scope.data.currentExercise.exercise_type = exercise.exercise_type
    $scope.data.currentExercise.difficulty = exercise.difficulty

    $scope.formData.editExerciseName = exercise.name
    $scope.formData.editExerciseMuscle = exercise.muscle
    $scope.formData.editExerciseExerciseType = exercise.exercise_type
    $scope.formData.editExerciseDifficulty = exercise.difficulty

  $scope.editExercise = ->
    console.log $scope.formData
    exerciseData.editExercise($scope.formData)
    $scope.returnBack()

  $scope.returnBack = ->
    $location.url('/')

  @deferred = $q.defer()
  @deferred.promise.then($scope.prepExerciseData)
  exerciseData.loadExercises(@deferred)

@ExerciseEditCtrl.$inject = ['$scope', '$location', 'exerciseData', '$q', '$routeParams']