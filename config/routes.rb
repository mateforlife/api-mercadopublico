Rails.application.routes.draw do
  resources :key_words
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :market do
    get '/biddings', to: 'biddings#index'
    get '/biddings/:id', to: 'biddings#show'
  end

  resources :biddings
  resources :suggested_biddings
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  root to: 'market/biddings#index'
end
