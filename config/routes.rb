Rails.application.routes.draw do
  root to: "home#index"

  get "/uploads" => "uploads#index"
  post "/uploads" => "uploads#create"
  delete "/uploads" => "uploads#destroy_all"

  devise_scope :user do
    get "/register" => "authreg#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users, :controllers => {:sessions => "sessions"}
  # devise_scope :user do
  #   authenticated :user do
  #     root 'home#index', as: :authenticated_root
  #   end

  #   unauthenticated do
  #     root 'home#index', as: :unauthenticated_root
  #   end
  # end
  resources :uploads 
  resources :notes
  resources :deployments do
    resources :devices
  end
  resources :timeseries
  resources :sensors
  resources :devices
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
