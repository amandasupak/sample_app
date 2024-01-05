module SessionsHelper
    # Log in current user
    def login_in(user)
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
end
