class SellBooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_book_owner, only: [:edit, :update, :destroy]
  before_action :check_user_school

  def index
    @q = SellBook.is_active.search(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    @book = SellBook.find(params[:id])
    @book_image = @book.photos.first
    @seller_url = User.find(@book.user_id).facebook_url
  end

  def new
    if current_user.facebook_url == "" || current_user.facebook_url == nil
      redirect_to edit_user_registration_path(current_user.id), notice: 'Please add Facebook_url before selling book!'
    else
      @book = current_user.sell_books.build
    end
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
    @book_photos = @book.photos
  end

  def update
    @book = SellBook.find(params[:id])
    respond_to do |format|
      if sell_book_params[:photos_attributes]["0"].present?
        @book.photos.each do |image|
          image.destroy
        end
      end
      if @book.update(sell_book_params)
        @book.photos.each do |image|
          if image.image_file_name == nil
            image.destroy
          end
        end
        format.html { redirect_to @book, notice: 'Text was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    SellBook.find(params[:id]).update(active_flag: false)
    redirect_to selling_book_user_path(current_user.id)
  end

  private

  def check_book_owner
    @book = SellBook.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to @book
    end
  end

  def sell_book_params
    params.require(:sell_book).permit(:active_flag, :name, :description, :class_name, :prof_name, :price, :user_id, photos_attributes: :image)
  end

  def check_user_school
    if user_signed_in?
      if current_user.school_name == nil || current_user.facebook_url == nil || current_user.email == nil || current_user.major == nil
        redirect_to edit_user_registration_path(current_user.id), notice: 'Please fill in the blank'
      end
    end
  end
end
