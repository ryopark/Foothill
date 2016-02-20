class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name, null: false, default: ''
      t.string :prof_name, null: false, default: ''
      t.boolean :in_class, default: true
      t.string :book_name

      t.timestamps null: false
    end
  end
end
