class AddAttachmentImageToSellBooks < ActiveRecord::Migration
  def self.up
    change_table :sell_books do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sell_books, :image
  end
end
