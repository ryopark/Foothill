class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, null: false, index: true
      t.references :message_group, null: false, index: true
      t.text       :body, null: false

      t.timestamps null: false
    end
  end
end
