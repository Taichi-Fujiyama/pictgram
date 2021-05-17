class CommentsController < ApplicationController
  def index
    @comments_topics = current_user.comment_topics
  end
  
  def create
    comment = Comment.new
    comment.user_id = comment_user.id
    comment.topic_id = params[:topic_id]
    
    if @comments.save
      redirect_to topics_path, success: "コメントしました"
    else
      redirect_to topics_path, danger: "コメントに失敗しました"
    end
  end
end

