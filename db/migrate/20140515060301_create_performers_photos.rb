class CreatePerformersPhotos < ActiveRecord::Migration
  def change
    create_table :performers_photos do |t|
      t.integer :performer_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
