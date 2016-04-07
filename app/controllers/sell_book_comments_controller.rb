class SellBookCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @sell_book_comment = SellBookComment.new
  end

  def create
    @sell_book = SellBook.find(params[:sell_book_id])
    @sell_book_comment = @sell_book.sell_book_comments.build(sell_book_comment_params)
    if @sell_book_comment.save
      redirect_to @sell_book, notice: 'Posted comment'
    else
      render :new, sell_book_id: @sell_book.id
    end
  end

  private

  def sell_book_comment_params
    params.require(:sell_book_comment).permit(:user_id, :sell_book_id, :body).merge(user_id: current_user.id)
  end
end
