Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :res_name do
    
  end

  get '/volunteers', to: 'volunteers#index'
  get '/volunteers/:id', to: 'volunteers#show'
  post '/volunteers', to: 'volunteers#create'

  post '/login', to: 'volunteers#login'
  
  put '/volunteers/:id', to: 'volunteers#update'
end
#login?volunteer