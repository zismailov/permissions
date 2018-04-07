# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  action     :string
#  value      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ApplicationRecord
  has_many :permission_users
  has_many :users, through: :permission_users

  validates :action, uniqueness: { scope: :value }
end
