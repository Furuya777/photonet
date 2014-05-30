class CreateInformationContents < ActiveRecord::Migration
  def change
    create_table :information_contents do |t|

      t.string   :information_area,    null: false
      t.text     :content,      limit: 4294967295

      t.timestamps
    end
  end
end
