class Workout < ActiveRecord::Base
   belongs_to :user
   has_many :exercises

   def self.valid_params?(params)
      return !params[:title].empty?
   end

end
