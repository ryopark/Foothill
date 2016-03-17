class RenamePhotoIdColumnToPhoto < ActiveRecord::Migration
  def change
    rename_column :photos, :photo_id, :imageable_id
    rename_column :photos, :photo_type, :imageable_type
  end
end
