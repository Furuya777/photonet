class AddColumnProfileToPerformer < ActiveRecord::Migration
  def change
      add_column :performers, :profile, :text
  end
end
