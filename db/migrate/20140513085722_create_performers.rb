class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|

      t.string    :last_name
      t.string    :first_name
      t.string    :last_name_kana
      t.string    :first_name_kana
      t.date      :birth
      t.integer   :gender
      t.string    :height
      t.string    :weight
      t.date      :leaved_on
      t.date      :graduated_on
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
