Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    resources :pokemon, only: [:index, :create] do
      get "types", on: :collection
    end
    resources :pokemon, only: [:show, :update] do 
      resources :items, only: [:index, :create]
    end
    resources :items, only: [:update, :destroy]
  end

  
  # api/pokemon
  # api/pokemon/:id
  # api/moves
  # api/moves/id
  # api/items
  # api/items/:id
  # api/pokemon/:pokemonId/moves
  # api/pokemon/:pokemonId/items
  # api/pokemon/types

end
