Rails.application.routes.draw do
  resources :notes
  resources :deployments
  resources :timeseries
  resources :sensors
  resources :devices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
