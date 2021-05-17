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
  resources:topics, :except => :show
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
  #いいね解除のためのルーティングを追加
  delete "/favorites", to: "favorites#destroy"
  #いいねを外すのにもリンクを付与するためにビューを編集する(views/topics/index.html.erb)
  
  get "topics/comment" => "topics#comment_create"
  # 追加のアクション（コメントの内容を受け取るためのアクションを用意したい)
  post "topics/comment" => "topics#comment"
  # ここまで追加
  
end
