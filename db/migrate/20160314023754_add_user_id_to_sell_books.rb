class AddUserIdToSellBooks < ActiveRecord::Migration
  def change
    add_column :sell_books, :user_id, :integer
  end
end
