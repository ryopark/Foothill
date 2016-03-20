class SellBooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @q = SellBook.search(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    @book = SellBook.find(params[:id])
    @book_image = @book.photos.first
  end

  def new
    @book = current_user.sell_books.build
  end

  def create
    @book = current_user.sell_books.build(sell_book_params)
    if @book.save
      redirect_to @book, notice: 'you completely registered your book!'
    else
      render :new
    end
  end

  private

  def sell_book_params
    params.require(:sell_book).permit(:name, :class_name, :prof_name, :price, :user_id, :deanza_flag, :foothill_flag, photos_attributes: :image)
  end
end
