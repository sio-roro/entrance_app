class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    @comment = tweet.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice]="Commented!"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Your comment was falled..."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find_by(id:params[:id]).destroy
    flash[:notice]="Comment was deleted!"
    redirect_back(fallback_location: root_path)

  end

  private

    def comment_params
      params.require(:comment).permit(:comment)
    end

end
