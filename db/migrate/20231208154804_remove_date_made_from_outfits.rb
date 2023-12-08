class RemoveDateMadeFromOutfits < ActiveRecord::Migration[7.0]
  def change
    remove_column :outfits, :date_made, :date
  end
end
