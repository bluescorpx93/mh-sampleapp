class SessionsController < ApplicationController
 def new
 end

 def create
 	@user=User.find_by(email: params[:session][:email].downcase)
 	if @user && @user.authenticate(params[:session][:password])
 		session[:user_id]= @user.id
			flash[:info] = "Hi #{@user.name}!"
 		redirect_to @user 
 	else
 		flash[:danger]="Oops! Invalid email/password combination."
 		redirect_to common_login_path
 	end
 end

 def destroy
 	session.delete(:user_id)
 	@current_user=nil
 	redirect_to common_login_path
 end
end
