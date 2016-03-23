class SellBookCommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  
  def create
    @sell_book = SellBook.find(params[:sell_book_id])
    @sell_book_comment = @sell_book.sell_book_comments.build(sell_book_comment_params)
    if sell_book_comment.save
      redirect_to @sell_book
    else
      redirect_to @sell_book
    end
  end

  private

  def sell_book_comment_params
    params.require(:sell_book_comment).permit(:user_id, :sell_book_id, :body)
  end
end
