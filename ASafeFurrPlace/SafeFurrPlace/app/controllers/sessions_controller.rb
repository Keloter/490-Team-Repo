class SessionsController < ApplicationController
 
	before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def destroy
		session.clear
		session.destroy
		logout
	end

	def home
		
		#Home Page
	end

	def profile
		#Profile Page
	end

	def setting
		#Setting Page
	end

	def login
		session.clear
		reset_session
		#Login Form
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			cookies.delete :user_id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
			redirect_to(:action => 'home')

			


		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session.clear
		reset_session
		cookies.delete(:user_id)
		session[:user_id] = nil
	end

end