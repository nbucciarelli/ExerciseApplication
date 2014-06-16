class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
  end

  def create
    @exercise = Exercise.create exercise_params
  end

  def update
    @exercise = Exercise.find params[:id]
    @exercise.update_attributes exercise_params
    respond_to do |format|
      format.json { render json: @exercise.as_json }
    end
  end

  def destroy
    @exercise = Exercise.find params[:id]
    @exercise.delete
    respond_to do |format|
      format.json { render json: @exercise.as_json }
    end
  end

private
  def exercise_params
    params.require(:exercise).permit(:name, :muscle, :exercise_type, :difficulty)
  end


end
