Rails.application.routes.draw do  
  # devise_for :users
  # root to: "devise/sessions#new"

  devise_scope :user do
    root to: "devise/sessions#new"

    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/sign_in' => 'devise/sessions#new'
    get '/users/sign_up' => 'devise/registrations#new'

    get '/users/password/new' => 'devise/passwords#new'
    get '/users/password/edit' => 'devise/passwords#edit'
  end




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
