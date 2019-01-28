Rails.application.routes.draw do
  resources :key_words
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :market do
    get '/biddings', to: 'biddings#index'
    get '/biddings/:id', to: 'biddings#show'
  end

  resources :biddings
  resources :suggested_biddings
  root to: 'market/biddings#index'
end
