Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  #Routes (User)
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  #Routes (User)
  resources :users do
    #Nested Resource (Artworks)
    resources :artworks, only: [:index, :show, :create, :update, :destroy]
  end

  #Routes (ArtworkShares)
  resources :artworkshares, only: [:index, :create, :destroy]

  #Routes(Comments)
  resources :comments, only: [:index, :create, :destroy]

end
