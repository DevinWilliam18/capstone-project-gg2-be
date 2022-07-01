Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/volunteers', to: 'volunteers#index'
  get '/volunteers/:id', to: 'volunteers#show'
  post '/volunteers', to: 'volunteers#create'
  
  put '/volunteers/:id', to: 'volunteers#update'
end
