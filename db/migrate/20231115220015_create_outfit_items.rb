class CreateOutfitItems < ActiveRecord::Migration[7.0]
  def change
    create_table :outfit_items do |t|
      t.references :outfit
      t.references :item

      t.timestamps
    end
  end
end
