class SessionsController < ApplicationController
	before_filter :authenticate_volunteer, :except => [:index, :login, :login_attempt, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def destroy
		logout
		redirect_to '/sessions/login'
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
		#Login Form
	end

	def login_attempt
		authorized_volunteer = Volunteer.authenticate(params[:username_or_email],params[:login_password])
		if authorized_volunteer
			session[:volunteer_id] = authorized_volunteer.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_volunteer.username}"
			redirect_to(:action => 'home')


		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:volunteer_id] = nil
	end

end