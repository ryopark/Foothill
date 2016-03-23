class CreateSellBookComments < ActiveRecord::Migration
  def change
    create_table :sell_book_comments do |t|
      t.references :sell_book, index: true, null: false
      t.references :user, index: true, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
