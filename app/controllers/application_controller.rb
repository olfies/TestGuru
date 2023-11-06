class ApplicationController < ActionController::Base
  before_action :authenticate_user!

 protected

  def authenticate_user!
    unless current_user
      cookies[:redirect_to] = request.url
    end
    cookies[:email] = current_user&.email
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end


  def logged_in?
    current_user.present?
  end
end
