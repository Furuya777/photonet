class CreateGroupsPerformers < ActiveRecord::Migration
  def change
    create_table :groups_performers do |t|
      t.integer :group_id
      t.integer :performer_id
      
      t.timestamps
    end
  end
end
