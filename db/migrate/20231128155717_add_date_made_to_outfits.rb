class AddDateMadeToOutfits < ActiveRecord::Migration[7.0]
  def change
    add_column :outfits, :date_made, :date
  end
end
