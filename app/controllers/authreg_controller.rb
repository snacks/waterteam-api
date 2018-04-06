class AuthregController < Devise::RegistrationsController
  skip_before_action :require_login
  http_basic_authenticate_with :name => "waterbear", :password => "waterbearteam"

  def new
    super
  end
end