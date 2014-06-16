angular.module('ExerciseApp').factory('muscleData', ['$http', ($http) ->
  muscleData =
    data:
      muscles: [ ]
    isLoaded: false

  muscleData.loadMuscles = (deferred) ->
    if muscleData.isLoaded == false
      $http.get("/muscles.json").success( (data) ->
        muscleData.data.muscles = data
        muscleData.isLoaded = true
        console.log("Successfully loaded muscles.")
        if deferred
          deferred.resolve()
      ).error( ->
        console.log("Failure to load muscles.")
        if deferred
          deferred.reject("Failed to load muscles.")
      )
    else
      if deferred
        deferred.resolve()

  return muscleData

])