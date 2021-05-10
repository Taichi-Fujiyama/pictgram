class FavoritesController < ApplicationController
  def index
   @favorite_topics = current_user.favorite_topics
  end
  
  def create
     favorite = Favorite.new
     favorite.user_id = current_user.id
     favorite.topic_id = params[:topic_id]
     
     if favorite.save
       redirect_to topics_path, success: "お気に入り登録しました"
     else
       redirect_to topics_path, success: "お気に入り登録に失敗しました"
     end 
  end 
  
  #いいねを解除するためにdestroyアクションを定義する
  def destroy
      favorite = Favorite.find_by(user_id: current_user.id,topic_id: params[:topic_id])
      favorite.destroy
      if favorite.destroyed?
          redirect_to topics_path, success: "いいねを解除しました"
      else
          redirect_to topics_path, success: "いいねを解除できませんでした"
      end
  end
  #同様にルーティングも修正を加える(config/routes.rb)
  
end
