class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		@user = User.where(email: params[:email]).first

		if !@user.nil?
			session[:current_user_id] = @user.id
			cookies.signed[:user_id] = @user.id
			flash[:notice]="Log in correcto"
			@user.show
		else
			flash[:notice]="Email o password incorrecto!"
		end


	end

	# "Delete" a login, aka "log the user out"
	def destroy
		#complete this method
		# Remove the user id from the session
		@_current_user = session[:current_user_id] = nil
		cookies.signed[:user_id] = nil
		session[:current_user_id] = nil
		flash[:notice] = "Log out correcto"
		redirect_to log_in_path
	end
end

