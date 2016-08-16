class SellBooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_book_owner, only: [:edit, :update, :destroy]
  before_action :check_user_school

  def index
    #root page(ヘッダーにsign_up menu bottun)
    # get DefaultでSellBookのactive_flagがTrueの本をすべて一覧
    # get Userの写真（右上のメニューボタン）を取得する(current_user.photo.image.url)

    # 検索
    # GET "/sell_books?utf8=%E2%9C%93&q%5Bname_start%prof_name_start%5D=
    # class_name_start%5D=music&commit=search" {"utf8"=>"✓", "q"=>{"name_start"=>"",
    # "prof_name_start"=>"", "class_name_start"=>"music"}, "commit"=>"search"}
    @q = SellBook.is_active.search(params[:q])
    @books = @q.result(distinct: true)
  end

  def show
    #/sell_books/id
    @book = SellBook.find(params[:id])
    @book_image = @book.photos.first
    @seller_url = User.find(@book.user_id).facebook_url
  end

  def new

    # UserがfacebookURLを登録してない場合、コンタクトが出来ないため。
    if current_user.facebook_url == "" || current_user.facebook_url == nil
      redirect_to edit_user_registration_path(current_user.id), notice: 'Please add Facebook_url before selling book!'
    else
    # type: 'Get',
    # url: '/sell_books/new
    #   id: nil,
    #   name: "",
    #   prof_name: "",
    #  in_class: true,
    #  class_name: "",
    #  created_at: nil,
    #  updated_at: nil,
    #  price: nil,
    #  user_id: current_user.id
    #  deanza_flag: false,
    #  foothill_flag: false,
    #  description: nil, → オプション
    #  sell_now_flag: false,　→ 使ってない
    #  sell_next_flag: false,　→　使ってない
    #  active_flag: true>
    #SellBook.photosも生成(PhotoModel)
      @book = current_user.sell_books.build
    end
  end

  def create
    # POST　/sell_books
    # Parameterの例
    # {"utf8"=>"✓",
    #  "authenticity_token"=>" ",
    # "sell_book"=>{"photos_attributes"=>{"0"=>{"image"=>#<ActionDispatch::Http::UploadedFile:0x007fcb536ebc90
    # @tempfile=#<Tempfile:~~~>, @original_filename=" ",
    # @content_type="image/jpeg",
    # @headers="Content-Disposition: form-data; name=\"sell_book[photos_attributes][0][image]\";
    # filename=\"MAth.jpg\"\r\nContent-Type: image/jpeg\r\n">}},
    # "name"=>"", "description"=>" ", "class_name"=>"",
    # "prof_name"=>"", "price"=>""}, "commit"=>"submit"}
    @book = current_user.sell_books.build(sell_book_params)
    if @book.save
      #sell_books/id へ
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
    #   sell_bookの画像更新。現在の設定では、1:1の関係で画像と本は成り立たせたい。保存は、
    #   paperclipを使っているが、更新ができない。なので、ここでは、もし写真が１枚でもあれば、
    #   それを削除して、また新しく写真を保存する作業をしている。
    respond_to do |format|
      if sell_book_params[:photos_attributes]["0"].present?
        @book.photos.each do |image|
          image.destroy
        end
      end
      if @book.update(sell_book_params)
        #　Userが写真を空でupdateすると、nilで写真が保存されてしまうのでそれを削除する。
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
    #データを保存しときたいので、本当に削除はせず表示されないようにしている。
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
      # Facebookでアカウントを作っても得られない情報を機能を制限して、事前にユーザーに入力してもらうため。
      if current_user.school_name == nil || current_user.facebook_url == nil || current_user.email == nil || current_user.major == nil
        redirect_to edit_user_registration_path(current_user.id), notice: 'Please fill in the blank'
      end
    end
  end
end
