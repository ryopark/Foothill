class FavoritesController < ApplicationController
  before_action :authenticate_user!
  # Acts as votable と Omni Gem の使用
  def create
    @book = SellBook.find(params[:sell_book_id])
    @book.liked_by current_user
  end

  def remove
    @book = SellBook.find(params[:sell_book_id])
    @book.disliked_by current_user
  end
end
