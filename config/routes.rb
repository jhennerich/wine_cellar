Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/winecellars', to: 'winecellars#index'
  get '/winecellars/new', to: 'winecellars#new'
  post '/winecellars', to: 'winecellars#create'
  get '/winecellars/:id', to: 'winecellars#show'
  get '/winecellars/:id/edit', to: 'winecellars#edit'
  patch '/winecellars/:id', to: 'winecellars#update'
  delete '/winecellars/:id', to: 'winecellars#destroy'
end
