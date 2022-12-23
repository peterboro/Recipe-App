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

  devise_for :users, :controllers => {
    :registrations => 'devise/registrations',
    :sessions => 'devise/sessions',
    :confirmations => 'devise/confirmations'
  }

  resources :user do
    resources :inventory do
      resources :inventory_food, only: [:new, :create, :destroy, :index]
    end
    resources :food
    resources :recipe do
      resources :recipes_food, only: [ :index, :new, :create, :destroy, :update]
    end
  end

  get '/public_recipes', to: 'recipe#public'
  # shoping list
  get '/shopping_list', to: 'food#shopping'

  post '/shopping_list', to: 'food#list'

  root to: 'user#index'
end