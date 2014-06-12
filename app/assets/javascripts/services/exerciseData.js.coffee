angular.module('ExerciseApp').factory('exerciseData', ['$http', ($http) ->
  exerciseData =
    data:
      exercises: [
        {
          name: "temporar",
          muscle: "temporary",
          exercise_type: "temporary",
          difficulty: "temporary"
        }
      ]
    isLoaded: false

  exerciseData.loadExercises = (deferred) ->
    if exerciseData.isLoaded == false
      $http.get("/exercises.json").success( (data) ->
        exerciseData.data.exercises = data
        exerciseData.isLoaded = true
        console.log("Successfully loaded exercises.")
        if deferred
          deferred.resolve()
      ).error( ->
        console.log("Failure to load exercises.")
        if deferred
          deferred.reject("Failed to load exercises.")
      )
    else
      if deferred
        deferred.resolve()

  exerciseData.createExercise = (newExercise) ->
    data = 
      exercise: 
        name: newExercise.newExerciseName
        muscle: newExercise.newExerciseMuscle
        exercise_type: newExercise.newExerciseExerciseType
        difficulty: newExercise.newExerciseDifficulty

    $http.post('/exercises.json', data).success( (data) ->
      exerciseData.data.exercises.push(data)
      console.log('Successfully created exercise.')
    ).error( ->
      console.log('Failed to create new exercise')
    )

    return true

  exerciseData.editExercise = (editExercise) ->
    data =
      exercise:
        name: editExercise.editExerciseName
        muscle: editExercise.editExerciseMuscle
        exercise_type: editExercise.editExerciseExerciseType
        difficulty: editExercise.editExerciseDifficulty
        id: editExercise.editExerciseId
    $http.put("/exercises/#{editExercise.editExerciseId}.json", data).success( (data) ->
      exercise = _.findWhere(exerciseData.data.exercises, { id: parseInt(editExercise.editExerciseId)})
      exercise.name = data.name
      exercise.muscle = data.muscle
      exercise.exercise_type = data.exercise_type
      exercise.difficulty = data.difficulty
      console.log('Successfully edited exercise.')
    ).error( ->
      console.log('Failed to edit new exercise')
    )
    return true

  exerciseData.deleteExercise = (exerciseId) ->
    data =
      exercise:
        id: exerciseId
    $http.delete("/exercises/#{exerciseId}.json", data).success( (data) ->
      exerciseData.data.exercises = _.without(exerciseData.data.exercises, _.findWhere(exerciseData.data.exercises, {id: parseInt(exerciseId)}))
      console.log('Successfully deleted exercise.')
    ).error( ->
      console.log('Failed to delete exercise.')
    )

    return true



  return exerciseData

])