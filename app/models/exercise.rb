class Exercise < ActiveRecord::Base
   belongs_to :workout

   def self.valid_params?(params)
     return !params[:name].empty? && !params[:reps].empty?
   end
end
