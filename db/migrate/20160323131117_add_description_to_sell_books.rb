class AddDescriptionToSellBooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :description, :text
  end
end
