class ApplicationController < ActionController::Base
  before_action :require_login

  layout "application"
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    projects_url
  end

  private

  def require_login
    unless user_signed_in?
      redirect_to root_url, :notice => "Login required for access"
    end
  end
end
