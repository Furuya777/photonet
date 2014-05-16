class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

      t.string    :name
      t.date      :organized_on
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
