# == Schema Information
#
# Table name: permission_roles
#
#  id            :integer          not null, primary key
#  role_id       :integer
#  permission_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require "rails_helper"

RSpec.describe PermissionRole, type: :model do
  describe "associations" do
    it { is_expected.to belong_to :permission }
    it { is_expected.to belong_to :role }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :permission_id }
    it { is_expected.to validate_presence_of :role_id }
  end
end
