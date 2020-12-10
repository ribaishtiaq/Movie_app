Rails.application.routes.draw do
  root 'movies#index'
  get 'static_pages/help'
  get 'watchlists/create'
  get 'watchlists/destroy'
  get 'help' , to: "static_pages#help"
  get '/watchlists', to: 'users#watchlist'
  get '/watched', to: 'users#watched'

  post '/rate' => 'rater#create', :as => 'rate'
  post '/watches' , to: "watches#create" 
  delete 'watches', to: "watches#destroy"

  devise_for :users
  devise_scope :user do 
    get "/users/sign_out" => "devise/sessions#destroy" 
  end

  #resources :users, only: [:show]
  resources :movies
  resources :watches, only: [:create, :destroy]
  resources :watchlists, only: [:create, :destroy]
  resources :reviews, only: [:create, :destroy]
  resources :users, only: [:show] do
    member do
      get :watched, :watchlist
    end
  end
end
