class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end 
  
  def new
    @topic = Topic.new
  end
  
  
  
  
  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def comment_create
    # 下記内容を追加
    @comment = Comment.new(comment: params[:comment])
    @comment.user_id = current_user.id
    
    # if @comment.save
    #   redirect_to topics_path, success: 'コメントしました'
    # else
    #   flash.now[:danger] = "コメントに失敗しました"
    # end
    # ここまで追加
  end
  
  # 追加したアクション
  def comment
    @comment = Comment.new(comment: params[:comment])
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = "コメントに失敗しました"
    end
    
  end
  # ここまで追加
  
  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end

