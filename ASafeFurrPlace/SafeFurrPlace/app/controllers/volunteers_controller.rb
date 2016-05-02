class VolunteersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  
  def new
  	@volunteer = Volunteer.new
  end

  def create
  	@volunteer = Volunteer.new(volunteer_params)
  	if @volunteer.save
  		flash[:notice] = "You have been registered successfully"
  		flash[:color]  = "valid"
  	else 
  		flash[:notice] = "The form is invalid"
  		flash[:color]  = "invalid"
  	end
  	render "new"
  end

  def edit
  end
  
  private
    def volunteer_params
      params.require(:volunteer).permit(:username, :email, :password, :password_confirmation)
    end
end
