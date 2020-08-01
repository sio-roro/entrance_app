class LikesController < ApplicationController
  
  def create
    @tweet=Tweet.find_by(id:params[:tweet_id])
    @like = current_user.likes.create(tweet_id: params[:tweet_id])
    
  end

  def destroy
    @tweet=Tweet.find_by(id:params[:tweet_id])
    @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @like.destroy
    
  end


end
