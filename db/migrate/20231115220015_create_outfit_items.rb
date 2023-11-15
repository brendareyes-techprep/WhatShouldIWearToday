class CreateOutfitItems < ActiveRecord::Migration[7.0]
  def change
    create_table :outfit_items do |t|
      t.integer :outfit_id
      t.integer :item_id

      t.timestamps
    end
  end
end
