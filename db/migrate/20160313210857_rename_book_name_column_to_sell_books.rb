class RenameBookNameColumnToSellBooks < ActiveRecord::Migration
  def change
    rename_column :sell_books, :book_name, :class_name
  end
end
