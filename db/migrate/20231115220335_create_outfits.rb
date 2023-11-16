class CreateOutfits < ActiveRecord::Migration[7.0]
  def change
    create_table :outfits do |t|
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
