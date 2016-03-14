class SellBooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @q = SellBook.search(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    @book = SellBook.find(params[:id])
  end

  def new
    @book = current_user.sell_books.build
  end

  def create
    @book = current_user.sell_books.build(sell_book_params)
    if @book.save
      redirect_to @book, notice: 'you done'
    else
      render 'new'
    end
  end

  private
  
  def sell_book_params
    params.require(:sell_book).permit(:name, :class_name, :prof_name, :price, :user_id)
  end
end
