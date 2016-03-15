class AddImageToSellbooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :image, :string
  end
end
