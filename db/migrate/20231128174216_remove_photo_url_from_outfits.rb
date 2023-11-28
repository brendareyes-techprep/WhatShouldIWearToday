class RemovePhotoUrlFromOutfits < ActiveRecord::Migration[7.0]
  def change
    remove_column :outfits, :photo_url, :string
  end
end
