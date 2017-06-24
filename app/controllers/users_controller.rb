class UsersController < ApplicationController
 
 def show
 	@user=User.find(params[:id])
 end

 def new
 	@user = User.new
 end
 
 def create
 	@user=User.new(user_params)
 	if @user.save
 		session[:user_id]=@user.id
 		flash.now[:success] = "Hey, #{@user.name}! Welcome Aboard :)"
 		redirect_to @user
 	else
 		redirect_to common_login_path
 	end
 end
 
 def edit
 	@user = User.find(params[:id])
 end

 def update
 	@user=User.find(params[:id])
 	if @user.update(user_profile_params)
 		flash.now[:success]="Profile Updated"
 		redirect_to @user
 	else
 		render 'edit'
 	end
 end
 
 private
 def user_params
 	params.require(:user).permit(:name, :email, :password, :password_confirmation, :acctype)
 end

 private 
 def user_profile_params
	 params.require(:user).permit(:name, :email, :gender, :dob)
	end
end
