class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      login_user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid Login/Password Combination'
      render 'new', status: :unprocessable_entity
    end
  end
    
  def destroy
  end
end
