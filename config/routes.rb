Rails.application.routes.draw do
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  # resources :users, only: [:show]
  # resources :foods, only: [:index, :new, :create, :destroy]


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

    # Food routes
    resources :foods, only: [:index, :new, :create]

end
