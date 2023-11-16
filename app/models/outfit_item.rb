# == Schema Information
#
# Table name: outfit_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  outfit_id  :integer
#
# Indexes
#
#  index_outfit_items_on_item_id    (item_id)
#  index_outfit_items_on_outfit_id  (outfit_id)
#
class OutfitItem < ApplicationRecord
  belongs_to :outfit
  belongs_to :item
end
