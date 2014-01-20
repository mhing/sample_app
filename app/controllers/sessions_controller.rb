class SessionsController < ApplicationController
	
	def new
	end

	#used with signing up
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user #use friendly forwarding, method in app/helpers/sessions_helper
		else
			# create error
			flash.now[:error] = "Invalid email/password combination."
			render 'new'
		end
	end

	# used with sign out
	def destroy
		sign_out
		redirect_to root_url
	end

end
