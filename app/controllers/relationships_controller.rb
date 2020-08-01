class RelationshipsController < ApplicationController
  def create
    @user=User.find_by(id:params[:id])
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = 'You follow '+@user.username+'!'
      redirect_to @user
    else
      flash.now[:notice] = 'User following was failed!!'
      redirect_to @user
    end
  end

  def destroy
    @user=User.find_by(id:params[:id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = 'You unfollow '+@user.username+'!'
      redirect_to @user
    else
      flash.now[:notice] = 'User unfollowing was failed!!'
      redirect_to @user
    end
  end

  

end
