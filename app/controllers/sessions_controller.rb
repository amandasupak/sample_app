class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      #login the user and redirect to user's show page
    else
      #create an error message
      render 'new', status: :unprocessable_entity
  end
    
  def destroy
  end
end
