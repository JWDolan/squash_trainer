class WorkoutsController < ApplicationController

      get '/workouts' do
         redirect_if_not_logged_in
         @workouts = Workout.all
         erb :'workouts/index'
      end

      get '/workouts/new' do
         redirect_if_not_logged_in
         @error_message = params[:error]
         erb :'workouts/new'
      end

      post '/workouts' do
         redirect_if_not_logged_in
         unless Workout.valid_params?(params)
            redirect "/workouts/new?error=invalid workout"
         end
         Workout.create(title: params[:title])
         redirect to "/workouts"
      end

      get '/workouts/:id' do
         redirect_if_not_logged_in
         @workout = Workout.find_by_id(params[:id])
         erb :'workouts/show'
      end

      get '/workouts/:id/edit' do
         redirect_if_not_logged_in
         @error_message = params[:error]
         @workout = Workout.find_by_id(params[:id])
         erb :'workouts/edit'
      end

      patch '/workouts/:id' do
         redirect_if_not_logged_in
         @workout = Workout.find_by_id(params[:id])
         unless Workout.valid_params?(params)
            redirect "/workouts/#{@workout.id}/edit?error=invalid workout"
         end
         @workout.title = params[:title]
         @workout.save
         redirect to "/workouts/#{@workout.id}"
      end

      delete '/workouts/:id/delete' do
         @workout = Workout.find_by_id(params[:id])
         @workout.delete
         redirect to '/workouts'
      end

end
