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
class OutfitItem < ApplicationRecord
end
