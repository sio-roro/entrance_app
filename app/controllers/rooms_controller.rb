class RoomsController < ApplicationController

  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = Entrie.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entrie.create(params.require(:entrie).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entrie.where(user_id: current_user.id,room_id: @room.id).present?
      @messages = @room.messages.order(id: "DESC")
      @message = Message.new
      @entries = Entrie.where(room_id:@room.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
