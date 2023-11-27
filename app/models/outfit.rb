# == Schema Information
#
# Table name: outfits
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
# Indexes
#
#  index_outfits_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => users.id)
#
class Outfit < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id
  has_many :outfit_items
  has_many :items, through: :outfit_items

  accepts_nested_attributes_for :outfit_items
end
