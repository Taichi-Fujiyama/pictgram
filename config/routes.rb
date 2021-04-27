Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root "pages#index"
  get "pages/help"
  get "pages/link"
 
  resources:users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end

 
 