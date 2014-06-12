@ExerciseNewCtrl = ($scope, $location, exerciseData) ->
  $scope.data = exerciseData.data
  exerciseData.loadExercises(null)

  $scope.formData = 
    newExerciseName: ''
    newExerciseMuscle: ''
    newExerciseExerciseType: ''
    newExerciseDifficulty: ''

  $scope.returnBack = ->
    $location.url('/')

  $scope.createExercise = ->
    exerciseData.createExercise($scope.formData)
    $scope.returnBack()

  $scope.clearExercise = ->
    $scope.formData.newExerciseName = ''
    $scope.formData.newExerciseMuscle = ''
    $scope.formData.newExerciseExerciseType = ''
    $scope.formData.newExerciseDifficulty = ''

@ExerciseNewCtrl.$inject = ['$scope', '$location', 'exerciseData']

