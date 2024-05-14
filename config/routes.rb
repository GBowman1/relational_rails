Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Parent Routes
  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  post "/dealerships", to: "dealerships#create"
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:id/edit', to: 'dealerships#edit'
  patch '/dealerships/:id', to: 'dealerships#update'

# Child Routes
  get '/vehicles', to: 'vehicles#index'
  get '/vehicles/:id', to: 'vehicles#show'
  
# Nested Routes
  get '/dealerships/:dealership_id/vehicles', to: 'dealerships_vehicles#index'
  get '/dealerships/:dealership_id/vehicles/new', to: 'dealerships_vehicles#new'
  post '/dealerships/:dealership_id/vehicles', to: 'dealerships_vehicles#create'
end
