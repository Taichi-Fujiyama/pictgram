Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  root "pages#index"
  get "pages/help"
  get "pages/link"
 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources:users
  resources:topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
  #いいね解除のためのルーティングを追加
  delete "/favorites", to: "favorites#destroy"
  #いいねを外すのにもリンクを付与するためにビューを編集する(views/topics/index.html.erb)
end
