class UsersController < ApplicationController

	before_action :set_user, :authenticated?, :authorized?, only: [:show,:edit,:update,:destroy]

	def show
		@user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to new_user_path
		end
	end

	def edit
		@user

		respond_to do |format|
			format.html {redirect_to @user}
			format.js {}
		end
	end
	def update
		if @user.update_attributes(user_params)
		  redirect_to @user
		else
		  redirect_to edit_user_path
		end
	end

private
	def set_user
		@user = User.find(params[:id])
	end
	def authorized?
		if @user.id != session[:user_id]
			redirect_to @user
		end
	end

	def user_params
		return params.require(:user).permit(:user,:email,:password,:password_confirmation)
	end
end