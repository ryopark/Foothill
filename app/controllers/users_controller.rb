class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    redirect_to user_path(current_user) unless authenticate_user!
  end

  def show
  end

  def requested_book
    @messages = MessageGroup.where(buyer_id: current_user.id)
  end

  def selling_book
    @messages = MessageGroup.where(seller_id: current_user.id)
    @books = SellBook.where(user_id: current_user.id)
  end
end
