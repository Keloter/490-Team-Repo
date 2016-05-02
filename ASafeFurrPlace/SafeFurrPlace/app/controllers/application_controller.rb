class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  private

  def current_volunteer
    @current_volunteer ||= Volunteer.find_by(id: session[:volunteer_id]) if session[:volunteer_id]
  end

  helper_method :current_volunteer

    protect_from_forgery
    protected
    def authenticate_volunteer
    	unless session[:volunteer_id]
    		redirect_to(:controller => 'sessions', :action => 'login')
    		return false
    	else
        # set current_volunteer by the current volunteer object
        @current_volunteer = Volunteer.find session[:volunteer_id] 
    		return true
    	end
    end

    #This method for prevent volunteer to access Signup & Login Page without logout
    def save_login_state
      if session[:volunteer_id]
              redirect_to(:controller => 'sessions', :action => 'home')
              return false
      else
        return true
      end
    end
  end

