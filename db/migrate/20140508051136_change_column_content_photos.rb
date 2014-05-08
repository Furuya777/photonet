class ChangeColumnContentPhotos < ActiveRecord::Migration
  def change
    change_column :photos, :content, :text
  end
end
