class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed
        log_in user
        redirect_to root_url
      else
        flash.now[:danger] = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
  log_out
    redirect_to root_url
  end
end