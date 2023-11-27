class AddPhotoUrlToOutfits < ActiveRecord::Migration[7.0]
  def change
    add_column :outfits, :photo_url, :string
  end
end
