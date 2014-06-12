class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle
      t.string :exercise_type
      t.string :difficulty

      t.timestamps
    end
  end
end
