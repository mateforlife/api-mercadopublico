Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/licitaciones', to: 'biddings#index'
  get '/licitaciones/:id', to: 'biddings#show'
  get '/licitaciones/more', to: 'biddings#more_info'

  root to: 'biddings#index'
end
