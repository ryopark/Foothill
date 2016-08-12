# userが本をfavしておけるためのfavoirte機能。ユーザーは何個でも本を保存できるので1:多の関係で
# 成り立っている。
module Users
  class FavoritesController < ApplicationController
    before_action :authenticate_user!

    def index
      @books = current_user.votes.up.for_type(SellBook.is_active).order('created_at desc').votables
    end
  end
end
