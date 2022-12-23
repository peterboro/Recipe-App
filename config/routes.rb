Rails.application.routes.draw do
  # User authentication routes
  # devise_for :users

  # Food routes
  # resources :foods, only: [:index, :new, :create]
  
  # Recipe routes
  # resources :recipes do
  #   resources :foods
  # end

  # Public recipe list route
  # get '/public_recipes', to: 'recipes#public', as: 'public_recipes'

  # Root route
  # root to: 'recipes#index'

  devise_for :users



    get '/users/password/new' => 'devise/passwords#new'
    get '/users/password/edit' => 'devise/passwords#edit'
    get '/inventories' => 'inventories#index'
    post '/inventories/create' => 'inventories#create'
    post '/inventories/destroy' => 'inventories#destroy'
    get 'inventories/:inventory_id' => 'inventories#show'
    get '/inventories/compare/:recipes_id/inventory_id' => 'inventories#destroy'
  end

  # get 'foods/:id/edit', to: 'foods#edit', as: 'edit_food'
  # patch 'foods/:id', to: 'foods#update', as: 'update_food'
  # get 'foods/:id', to: 'foods#show', as: 'show_food'


    # User authentication routes
    devise_for :users
  resources :user do
    resources :inventories do
      resources :inventory_food, only: [:new, :create, :destroy, :index]
    end
    resources :foods
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy, :index]
    end
  end

  get '/public_recipes', to: 'recipes#public', as: 'public_recipes'

  get '/shopping_list', to: 'food#shopping'

  post '/shopping_list', to: 'food#list'

  root to: 'user#index'
end

