class AddColumnProfileImageToPerformer < ActiveRecord::Migration
  def change
    add_column :performers, :profile_image, :string
  end
end
