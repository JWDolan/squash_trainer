class CreateWorkouts < ActiveRecord::Migration[4.2]
   def change
      create_table :workouts do |t|
         t.string :title
      end
   end
end
