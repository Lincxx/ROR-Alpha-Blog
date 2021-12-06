module ApplicationHelper
    def gravatar_for(user, options = {size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "rounded mt-3 shadow mx-auto d-block" )    
    end

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
end
