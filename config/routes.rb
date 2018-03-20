Rails.application.routes.draw do
  devise_scope :user do
    get "/register" => "authreg#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users
  # devise_for :users, :controllers => { :registrations => 'authorizedregistration' }
  resources :notes
  resources :deployments
  resources :timeseries
  resources :sensors
  resources :devices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
