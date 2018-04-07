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

require "rails_helper"

RSpec.describe Permission, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:users).through(:permission_users) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:action).scoped_to(:value) }
  end
end
