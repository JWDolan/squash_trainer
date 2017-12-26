require './config/environment'

class ApplicationController < Sinatra::Base

   configure do
         set :views, "app/views"
   end

   get '/' do
         erb :home
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
         @user = User.find_by(username: params[:username])
         if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/account'
         else
            redirect to '/registrations/signup'
         end
   end

   get '/logout' do
      if session[:user_id] != nil
         session.destroy
         redirect to '/sessions/login'
      else
         redirect to '/'
      end
   end

   helpers do
         def redirect_if_not_logged_in
            if !logged_in?
               redirect '/sessions/login'
            end
         end

         def logged_in?
            !!session[:user_id]
         end

         def current_user
            User.find(session[:user_id])
         end
   end
end
