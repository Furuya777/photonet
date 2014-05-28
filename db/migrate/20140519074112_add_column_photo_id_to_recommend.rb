class AddColumnPhotoIdToRecommend < ActiveRecord::Migration
  def change
    add_column :recommends, :photo_id, :integer
  end
end
