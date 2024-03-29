module SessionsHelper
    # Log in current user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current user logged-in (if any)
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # Returns true if user is logged in, false if otherwise
    def logged_in?
        !current_user.nil?
    end

    #logs out current user
    def log_out
        reset_session
        @current_user = nil
    end
end
