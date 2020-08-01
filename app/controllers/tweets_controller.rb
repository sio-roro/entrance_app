class TweetsController < ApplicationController
  def index
    @tweets=Tweet.all.order(id: "DESC")
  end
  
  def new 
    @tweet=Tweet.new
   
  end 

  def show
    @tweet=Tweet.find(params[:id])
    @like = Like.new
    @comment=Comment.new
    @comments=Comment.where(tweet_id:@tweet.id).order(id: "DESC")
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      flash[:notice]="Your post was updated!"
      redirect_to :action => "show", :id => @tweet.id
    else
      render("tweets/new")
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:notice]="Your post was sheared!"
      redirect_to :action => "index"
    else
      render("tweets/new")
    end
  end 

  def destroy
    Tweet.find(params[:id]).destroy
    flash[:notice]="Your post was deleted!"
    redirect_to action: :index
  end
  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
