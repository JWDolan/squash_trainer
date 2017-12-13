require './config/environment'

class ApplicationController < Sinatra::Base

   configure do
         set :views, "app/views"
   end

   get '/' do
         erb :index
   end

   get '/registrations/signup' do
         erb :'registrations/signup'
   end

end
