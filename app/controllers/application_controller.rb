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

   post '/registrations' do
         if params[:username] == "" || params[:password] == ""
            redirect to '/registrations/signup'
         else
            @user = User.create(username: params[:username], password: params[:password])
            redirect '/'
         end
   end

   get '/sessions/login' do
         erb :'sessions/login'
   end

   post '/sessions' do
         @user = User.find_by(username: params[:username], password: params[:password])
         session[:id] = @user.id
         redirect '/'
   end

end
