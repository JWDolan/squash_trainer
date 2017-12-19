class ExercisesController < ApplicationController

   get "/exercises/new" do
     @error_message = params[:error]
     erb :'exercises/new'
   end

end
