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

  has_many :permission_roles
  has_many :roles, through: :permission_roles

  validates :action, uniqueness: { scope: :value }

  def self.grant_permission_to_user(hash, user)
    permission = if action_check?(hash)
                   Permission.create(hash)
                 else
                   Permission.find_by(hash)
                 end
    return false if permission?(user, permission)
    user.permissions << permission
    permission.save
  end

  def self.action_check?(hash)
    Permission.new(hash).valid?
  end

  def self.permission?(user, permission)
    user.permissions.include?(permission)
  end
end
