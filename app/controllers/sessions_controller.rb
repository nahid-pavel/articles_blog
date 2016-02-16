class SessionsController < ApplicationController
  
 def new

 end

 def create

   user = User.find_by(email: params[:session][:email].downcase)

   if user && user.authenticate(params[:session][:password])

     session[:user_id] = user.id

     flash[:success] ="You are Successfully Logged In"

     redirect_to user_path(user)


   else

      flash.now[:success] ="Email/Password is Incorrect"

      render 'new'


   end

 end

 def destroy

   session[:user_id]= nil

   flash[:success] ="You are Successfully Logged Out"

   redirect_to root_path

 end

      

end
