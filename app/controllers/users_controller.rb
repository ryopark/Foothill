class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
    if user_signed_in?
      redirect_to user_path(current_user)
    end
  end

  def show
  end
end
