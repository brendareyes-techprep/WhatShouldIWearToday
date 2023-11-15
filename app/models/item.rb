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
class Item < ApplicationRecord
end
