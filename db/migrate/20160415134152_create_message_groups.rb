class CreateMessageGroups < ActiveRecord::Migration
  def change
    create_table :message_groups do |t|
      t.references :sell_book, null: false, index: true
      t.integer :seller_id, null: false, index: true
      t.integer :buyer_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
