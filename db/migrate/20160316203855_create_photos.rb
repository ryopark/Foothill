class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :photo_id
      t.string :photo_type

      t.timestamps null: false
    end
  end
end
