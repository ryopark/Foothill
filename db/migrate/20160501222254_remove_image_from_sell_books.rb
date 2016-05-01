class RemoveImageFromSellBooks < ActiveRecord::Migration
  def change
    remove_attachment :sell_books, :image
  end
end
