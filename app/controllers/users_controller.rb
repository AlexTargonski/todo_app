class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end
  def new
        @user = User.new

  end

 def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
        flash[:success] = "Please confirm your email address to continue"
        redirect_to root_url
    else
      render 'new'
    end
  end
  def edit
    @user = User.find(params[:id])
  end

 def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end


  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the ToDo list! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_url
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
end
  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end
end