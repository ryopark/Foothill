class SellBooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @q = SellBook.search(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    @book = SellBook.find(params[:id])
    @book_image = @book.photos.first
    @sell_book_comments = @book.sell_book_comments.order(:id)
    @sell_book_comment = @book.sell_book_comments.build
  end

  def new
    @book = current_user.sell_books.build
  end

  def create
    @book = current_user.sell_books.build(sell_book_params)
    if @book.save
      redirect_to @book, notice: 'Completely registered your book!'
    else
      render :new
    end
  end

  def edit
    @book = SellBook.find(params[:id])
  end

  def update
    @book = SellBook.find(params[:id])
    if @book.update_attributes(sell_book_params)
      redirect_to @book
    else
      render :edit
    end
  end


  private

  def sell_book_params
    params.require(:sell_book).permit(:name, :description, :class_name, :prof_name, :price, :user_id, :sell_season, :deanza_flag, :foothill_flag, photos_attributes: :image)
  end
end
