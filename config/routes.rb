Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  # get '/volunteers', to: 'volunteers#index'
  # get '/volunteers/:id', to: 'volunteers#show'
  # post '/volunteers', to: 'volunteers#create'

  # post '/login', to: 'volunteers#login'
  
  # put '/volunteers/:id', to: 'volunteers#update'

  # get '/garbage_producers', to: 'garbage_producers#index'

  resources :garbage_producers do
    resources :foods do
      resources :detail_orders
    end
  end

  resources :volunteers do
    resources :orders do
      resources :detail_orders
    end
  end

  get '/foods', to: 'foods#index'
  get '/foods/:id', to: 'foods#show'

end
#login?volunteer