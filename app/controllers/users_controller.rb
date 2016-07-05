class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    redirect_to user_path(current_user) unless authenticate_user!
  end

  def show
  end

  def requested_book
    @messages = MessageGroup.requested(current_user)
  end

  def selling_book
    @messages = MessageGroup.selling(current_user)
    @books = current_user.sell_books.is_active
  end
end
