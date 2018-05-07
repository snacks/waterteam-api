class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :configure_devise_params, if: :devise_controller?

  layout "application"
  protect_from_forgery with: :exception

  include Current

  def after_sign_in_path_for(resource)
    projects_url
  end

  def set_current_user
    Current.user = current_user
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to root_url, :notice => "Login required for access"
    end
  end

  def configure_devise_params
    attributes = [:firstname, :lastname, :organization]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

end
