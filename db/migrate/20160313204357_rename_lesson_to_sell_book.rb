class RenameLessonToSellBook < ActiveRecord::Migration
  def change
    rename_table :lessons, :sell_books
  end
end
