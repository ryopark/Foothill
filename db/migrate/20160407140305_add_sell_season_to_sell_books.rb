class AddSellSeasonToSellBooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :sell_season, :string, null: false, default: ''
  end
end
