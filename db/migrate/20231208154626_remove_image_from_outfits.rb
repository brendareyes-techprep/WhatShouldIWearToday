class RemoveImageFromOutfits < ActiveRecord::Migration[7.0]
  def change
    remove_column :outfits, :image, :binary
  end
end
