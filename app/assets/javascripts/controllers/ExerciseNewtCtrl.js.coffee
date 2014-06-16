@ExerciseNewCtrl = ($scope, $location, exerciseData, muscleData) ->
  $scope.data = exerciseData.data
  $scope.muscles = muscleData.data
  
  exerciseData.loadExercises(null)
  muscleData.loadMuscles(null)

  $scope.formData = 
    newExerciseName: ''
    newExerciseMuscles: []
    newExerciseExerciseType: ''
    newExerciseDifficulty: ''

  $scope.returnBack = ->
    $location.url('/')
    $scope.clearMuscles()

  $scope.createExercise = ->
    $scope.formData.newExerciseMuscles = _.map(_.where($scope.muscles.muscles, {ticked: true }), (muscle) -> 
      return muscle.id
    ) 
    exerciseData.createExercise($scope.formData)
    $scope.returnBack()

  $scope.clearExercise = ->
    $scope.formData.newExerciseName = ''
    $scope.formData.newExerciseMuscles = []
    $scope.formData.newExerciseExerciseType = ''
    $scope.formData.newExerciseDifficulty = ''
    $scope.clearMuscles()

  $scope.clearMuscles = ->
    _.each($scope.muscles.muscles, (muscle) ->
      muscle.ticked = false
    )

@ExerciseNewCtrl.$inject = ['$scope', '$location', 'exerciseData', 'muscleData']

