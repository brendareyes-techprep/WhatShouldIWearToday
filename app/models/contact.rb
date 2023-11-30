# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  description :text
#  email       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Contact < ApplicationRecord
end
