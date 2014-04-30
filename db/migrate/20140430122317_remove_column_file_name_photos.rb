class RemoveColumnFileNamePhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :file_name
  end
end
