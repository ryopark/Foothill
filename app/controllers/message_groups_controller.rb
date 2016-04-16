class MessageGroupsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def show
    @message_group = MessageGroup.find(params[:id])
    @message = Message.new
  end

  def create
    @sell_book = SellBook.find(params[:sell_book_id])
    @message_group = @sell_book.message_groups.build
    @message_group.create(@message_group, current_user, @sell_book.user)
    redirect_to @message_group
  end
end
