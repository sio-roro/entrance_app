class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @tweets=Tweet.where(user_id:@user.id).order(id: "DESC") 
    @followings=@user.followings
    @followers=@user.followers
  end
end
