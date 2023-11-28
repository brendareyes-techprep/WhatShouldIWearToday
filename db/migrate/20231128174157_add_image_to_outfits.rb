class AddImageToOutfits < ActiveRecord::Migration[7.0]
  def change
    add_column :outfits, :image, :binary
  end
end
