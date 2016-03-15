class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def index
    redirect_to user_path(current_user) unless user_signed_in?
  end

  def show
  end
end
