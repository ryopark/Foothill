module Users
  class FavoritesController < ApplicationController
    before_action :authenticate_user!

    def index
      @books = current_user.votes.up.for_type(SellBook.is_active).order('created_at desc').votables
    end
  end
end
