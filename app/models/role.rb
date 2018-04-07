# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  validates :name, presence: true, on: :create

  has_many :permission_roles
  has_many :permissions, through: :permission_roles

  belongs_to :user
end
