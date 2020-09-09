class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @tweets=Tweet.where(user_id:@user.id).order(id: "DESC") 
    @followings=@user.followings
    @followers=@user.followers

    @currentUserEntry=Entrie.where(user_id: current_user.id)
    @userEntry=Entrie.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entrie.new
      end
    end
  end
end
