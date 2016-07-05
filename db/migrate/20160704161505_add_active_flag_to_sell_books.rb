class AddActiveFlagToSellBooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :active_flag, :boolean, default: true, null: false
  end
end
