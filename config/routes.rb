Rails.application.routes.draw do
  get '/', to: 'winecellars#index'

  get '/winecellars', to: 'winecellars#index'
  get '/winecellars/new', to: 'winecellars#new'
  post '/winecellars', to: 'winecellars#create'
  get '/winecellars/:id', to: 'winecellars#show'
  get '/winecellars/:id/wines', to: 'winecellar_wines#index'
  get '/winecellars/:id/edit', to: 'winecellars#edit'
  patch '/winecellars/:id', to: 'winecellars#update'
  delete '/winecellars/:id', to: 'winecellars#destroy'

  get '/wines', to: 'wines#index'
  get '/wines/new', to: 'wines#new'
  post '/wines', to: 'wines#create'
  post '/wines/new', to: 'wines#new'
  get '/wines/:id', to: 'wines#show'
  get '/wines/:id/edit', to: 'wines#edit'
  patch '/wines/:id', to: 'wines#update'
  post '/winecellars/:id/wines', to: 'winecellar_wines#create'
  post '/winecellars/:id/wines/new', to: 'winecellar_wines#new'
  delete '/wines/:id', to: 'wines#destroy'
end
