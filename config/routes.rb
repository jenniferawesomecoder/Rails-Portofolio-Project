Rails.application.routes.draw do
  root 'welcome#index'
  resources :users do
    get 'shows/behind', to: 'shows#behind'
    resources :watchlists 
    resources :shows, only: [:index]
  end
  resources :watchlists
  resources :listings, only: [:destroy]
  resources :shows do
    resources :listings, except: [:index, :destroy]
  end
  resources :genres, only: [:index, :show]
  resources :channels, only: [:index, :show]
  get '/search', to: 'shows#search'
  get '/auth/facebook/callback', to: 'users#facebook_login'
  get '/auth/:google_oauth2/callback' => 'users#create_google'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
