class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :isbn, null: false
      t.integer :amazon_price, null: false

      t.timestamps null: false
    end
  end
end
