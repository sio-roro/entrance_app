class MessagesController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    if Entrie.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :body, :room_id).merge(user_id: current_user.id))
      flash[:notice] = "You sent message!!!"
    else
      flash[:notice] = "メッセージ送信に失敗しました。"
    end
    redirect_to room_path(@message.room_id)
  end
end
