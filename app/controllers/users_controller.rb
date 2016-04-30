class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    redirect_to user_path(current_user) unless authenticate_user!
  end

  def show
  end

  def requested_book
    @messages = MessageGroup.requested
  end

  def selling_book
    @messages = MessageGroup.selling
    @books = current_user.sell_books
  end
end
