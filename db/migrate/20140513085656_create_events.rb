class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string    :name
      t.datetime  :opened_at
      t.datetime  :closed_at
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
