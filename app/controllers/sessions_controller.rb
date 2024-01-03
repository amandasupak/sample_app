class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #login the user and redirect to user's show page
    else
      flash.now[:danger] = 'Invalid Login/Password Combination'
      render 'new', status: :unprocessable_entity
    end
  end
    
  def destroy
  end
end
