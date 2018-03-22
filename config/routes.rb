Rails.application.routes.draw do
  root to: "home#index"

  devise_scope :user do
    get "/register" => "authreg#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users
  # devise_scope :user do
  #   authenticated :user do
  #     root 'home#index', as: :authenticated_root
  #   end

  #   unauthenticated do
  #     root 'home#index', as: :unauthenticated_root
  #   end
  # end
  resources :notes
  resources :deployments
  resources :timeseries
  resources :sensors
  resources :devices
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
