class WorkoutsController < ApplicationController

      get '/workouts' do
         @workouts = Workout.all
         erb :'workouts/index'
      end

      get '/workouts/new' do
         @error_message = params[:error]
         erb :'workouts/new'
      end

      post '/workouts' do
         unless Workout.valid_params?(params)
            redirect "/workouts/#{@workout.id}/edit?error=invalid workout"
         end
         @workout = Workout.create(title: params[:title])
         redirect to "/workouts"
      end

      get '/workouts/:id' do
         @workout = Workout.find_by_id(params[:id])
         erb :'workouts/show'
      end

      get '/workouts/:id/edit' do
         @error_message = params[:error]
         @workout = Workout.find_by_id(params[:id])
         erb :'workouts/edit'
      end

      patch '/workouts/:id' do
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
