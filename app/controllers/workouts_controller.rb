class WorkoutsController < ApplicationController

      get '/workouts' do
            @workouts = Workout.all
            erb :'workouts/index'
      end

      get '/workouts/new' do
         erb :'workouts/new'
      end

      post '/workouts' do
            @workout = Workout.create(title: params[:title])
            redirect to "/workouts"
      end

end
