class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :book_id, null: false
      t.integer :seller_id, null: false
      t.integer :price, null: false

      t.timestamps null: false
    end
  end
end
