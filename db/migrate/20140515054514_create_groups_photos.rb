class CreateGroupsPhotos < ActiveRecord::Migration
  def change
    create_table :groups_photos do |t|
      t.integer :group_id
      t.integer :photo_id
      
      t.timestamps
    end
  end
end
