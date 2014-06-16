class RemoveMuscleFromExercise < ActiveRecord::Migration
  def change
    remove_column :exercises, :muscle
  end
end
