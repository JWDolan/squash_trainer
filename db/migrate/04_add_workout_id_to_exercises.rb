class AddWorkoutIdToExercises < ActiveRecord::Migration[4.2]
   def change
      add_column :exercises, :workout_id, :integer
   end
end
