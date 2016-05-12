class AddSeasonFlagToSellBooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :sell_now_flag, :boolean, default: false
    add_column :sell_books, :sell_next_flag, :boolean, default: false
  end
end
