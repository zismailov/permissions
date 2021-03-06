# == Schema Information
#
# Table name: permission_users
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  permission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PermissionUser < ApplicationRecord
  belongs_to :permission
  belongs_to :user

  validates :permission_id, :user_id, presence: true
  validates :permission_id, uniqueness: { scope: :user_id }
end
