class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :cookie_code

      t.timestamps
    end
  end
end
