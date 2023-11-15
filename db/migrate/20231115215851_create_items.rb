class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :photo_url
      t.string :color_hex
      t.string :details
      t.integer :owner_id

      t.timestamps
    end
  end
end
