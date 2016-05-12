class RemoveSellSeasonFromSellBooks < ActiveRecord::Migration
  def change
    remove_column :sell_books, :sell_season
  end
end
