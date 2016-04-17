class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @message_group = MessageGroup.find(params[:message_group_id])
    @message = @message_group.messages.build(message_params)
    if @message.save
      redirect_to @message_group
    else
      redirect_to @message_group
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :message_group_id, :body).merge(user_id: current_user.id)
  end
end
