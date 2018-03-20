class AuthregController < Devise::RegistrationsController
    http_basic_authenticate_with :name => "waterbear", :password => "waterbearteam"
  def new
    super
  end
end