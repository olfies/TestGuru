class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    if params[:session].present?
      @user = User.find_by_email(params[:session][:email].downcase)
    else @user && @user.authenticate(params[:session][:password])
     @user # это метод, который вы должны определить в Helpers для входа пользователя
    end
    if  flash.now[:message] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
