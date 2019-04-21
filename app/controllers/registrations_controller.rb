class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
			@user = User.create(user_params)
		if @user.save
			redirect_to root_url, notice: "Has sido registrado!"
		else
			redirect_to sign_in_path, notice: "Hay algunos parametros incorrectos en su registro, porfavor corríjalos. 'Password must be between 8 to 12 alphanumeric characters' \n 'Phone must be between 9-12 characters'"

		end
	end

	def user_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
