class AddPriceToSellbooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :price, :integer
  end
end
