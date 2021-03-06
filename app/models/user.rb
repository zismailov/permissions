# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :roles

  has_many :permission_users
  has_many :permissions, through: :permission_users

  validates :email, :username, uniqueness: true, on: :create
  validates :email, :username, presence: true, on: :create

  def check_permission?(action)
    permission = permissions.find_by(action: action).try(:value)
    return permission unless permission.nil?

    roles.first.permissions.exists?(action: action)
  end
end
