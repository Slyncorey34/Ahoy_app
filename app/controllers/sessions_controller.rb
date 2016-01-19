class SessionsController < ApplicationController
	def new
	end

	def create
		

		@user = User.where(email: params[:email]).first
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to login_path
		end	

	end

	def destroy
		session[:user_id] = nil
	end
end