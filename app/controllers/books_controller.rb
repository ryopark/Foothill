class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_image = @book.photos.first
  end


  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book, notice: 'Completely registered your book!'
    else
      render json: book, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])
    #   sell_bookの画像更新。現在の設定では、1:1の関係で画像と本は成り立たせたい。保存は、
    #   paperclipを使っているが、更新ができない。なので、ここでは、もし写真が１枚でもあれば、
    #   それを削除して、また新しく写真を保存する作業をしている。
    respond_to do |format|
      if book_params[:photos_attributes]['0'].present?
        @book.photos.each do |image|
          image.destroy
        end
      end
      if @book.update(book_params)
        #　Userが写真を空でupdateすると、nilで写真が保存されてしまうのでそれを削除する。
        @book.photos.each do |image|
          if image.image_file_name == nil
            image.destroy
          end
        end
        format.html { redirect_to @book, notice: 'Text was successfully updated.' }
        format.json { render json: 'Updated', status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
    @book_photos = @book.photos
  end


  def destroy
    #データを保存しときたいので、本当に削除はせず表示されないようにしている。
    @book = Book.find(params[:id])
    if @book.destroy
    respond_to do |format|
        format.json { render json: 'removed', status: :ok }
      end
    else
      render json: @book, message: 'Failed to remove', status: :bad_request
    end

  end

  private


  def book_params
    params.require(:book).permit(:title, :author, :isbn, :amazon_price, photos_attributes: :image)
  end

end
