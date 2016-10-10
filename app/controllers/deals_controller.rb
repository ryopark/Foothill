class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def create
    deal =
  end

  def update
  end

  def destroy
  end

  private


  def book_params
    params.require(:book).permit(:id, :book_id, :seller_id, :price)
  end


end
