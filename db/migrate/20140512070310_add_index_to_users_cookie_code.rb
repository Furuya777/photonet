class AddIndexToUsersCookieCode < ActiveRecord::Migration
  def change
    add_index :users, :cookie_code, unique: true
  end
end
