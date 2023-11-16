class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :photo_url
      t.string :color_hex
      t.string :details
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
