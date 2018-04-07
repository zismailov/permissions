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

require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:permissions).through(:permission_users) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end
end
