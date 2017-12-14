class UsersController < ApplicationController
   get '/account' do
      @user = User.find_by_id(session[:user_id])
      erb :'users/account'
   end

end
