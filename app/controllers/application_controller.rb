class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in? # this makes it available to our views

    def current_user
        #if session[:user_id] 
        #   User.find(session[:user_id])
        # this is an other way of writing it
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
        #return the current_user, if there is no current_user them find the user
        #nice thing about this is we will not hit the db reapeatly to find the user
        
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
