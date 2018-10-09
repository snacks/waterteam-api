class AuthregController < Devise::RegistrationsController
  skip_before_action :require_login
  http_basic_authenticate_with :name => ENV['REG_AUTH_UN'], :password => ENV['REG_AUTH_PW']

  def new
    super
  end
end