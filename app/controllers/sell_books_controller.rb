class SellBooksController < ApplicationController
  def index
    @q = SellBook.search(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    @book = SellBook.find(params[:id])
  end

  def new
    @book = SellBook.new
  end

  def create
    @book = SellBook.new(sell_book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: "you done"
    else
      render 'new'
    end
  end

private
  def sell_book_params
    params.require(:sell_book).permit(:name, :class_name, :prof_name, :price, :user_id)
  end
end
