# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  color_hex  :string
#  details    :string
#  photo_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
# Indexes
#
#  index_items_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  owner_id  (owner_id => users.id)
#
class Item < ApplicationRecord
  mount_uploader :photo_url, PhotoUrlUploader
  belongs_to :user, foreign_key: :owner_id
  has_many :outfit_items
  has_many :outfits, through: :outfit_items
end
