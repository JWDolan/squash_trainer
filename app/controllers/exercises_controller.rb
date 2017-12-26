class ExercisesController < ApplicationController

   get "/exercises/new" do
      redirect_if_not_logged_in
     @error_message = params[:error]
     erb :'exercises/new'
   end

   get "/exercises/:id/edit" do
      redirect_if_not_logged_in  
     @error_message = params[:error]
     @exercise = Exercise.find(params[:id])
     erb :'exercises/edit'
   end

   post "/exercises/:id" do
      redirect_if_not_logged_in
     @exercise = Exercise.find(params[:id])
     unless Exercise.valid_params?(params)
       redirect "/exercises/#{@exercise.id}/edit?error=invalid exercise"
     end
     @exercise.update(params.select{|k|k=="name" || k=="reps" || k=="workout_id"})
     redirect "/exercises/#{@exercise.id}"
   end

   get "/exercises/:id" do
      redirect_if_not_logged_in
     @exercise = Exercise.find(params[:id])
     erb :'exercises/show'
   end

   post "/exercises" do
      redirect_if_not_logged_in
     unless Exercise.valid_params?(params)
      redirect "/exercises/new?error=invalid exercise"
     end
     Exercise.create(params)
     redirect "/workouts/<%=@exercise.workout.id%>"
   end

   delete '/exercises/:id/delete' do
      @exercise = Exercise.find_by_id(params[:id])
      @exercise.delete
      redirect to '/workouts'
   end

end
