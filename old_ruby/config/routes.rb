Rails.application.routes.draw do
  resources :tags
  root to: "home#index"

  get "/uploads" => "uploads#index"
  post "/uploads" => "uploads#create"

  # temporary admin functions
  delete "/uploads" => "uploads#destroy_all"
  delete "/projects" => "projects#destroy_all"

  devise_scope :user do
    get "/register" => "authreg#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users, :controllers => {:sessions => "sessions"}

  resources :uploads 
  resources :notes
  resources :deployments do
    resources :devices
  end
  resources :timeseries
  resources :sensors
  resources :devices
  resources :projects do
    resources :associations, path: :users, module: :projects
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
