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

require "rails_helper"

RSpec.describe PermissionUser, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :permission }
    it { is_expected.to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :permission_id }
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_uniqueness_of(:permission_id).scoped_to(:user_id) }
  end
end
