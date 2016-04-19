class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    redirect_to user_path(current_user) unless authenticate_user!
  end

  def show
  end

  def message_list
    @messages = MessageGroup.where(seller_id: current_user.id)
  end
end
