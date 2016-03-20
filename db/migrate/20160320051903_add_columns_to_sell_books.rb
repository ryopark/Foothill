class AddColumnsToSellBooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :deanza_flag, :boolean, default: false
    add_column :sell_books, :foothill_flag, :boolean, default: false
  end
end
