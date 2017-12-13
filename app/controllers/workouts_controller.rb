class WorkoutsController < ApplicationController

      get '/workouts' do
            @workouts = Workout.all
            erb :'workouts/index'
      end

end
