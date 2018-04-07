class PermissionUser < ApplicationRecord
  belongs_to :permission
  belongs_to :user

  validates :permission_id, :user_id, presence: true
  validates :permission_id, uniqueness: { scope: :user_id }
end
