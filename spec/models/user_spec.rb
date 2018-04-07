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
    it { is_expected.to have_many :roles }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end

  describe "User" do
    context "when create" do
      it "valid data" do
        user = build(:user)
        expect { user.save }.to change(User, :count).by(1)
      end

      it "invalid data" do
        user = build(:user, username: nil)
        expect { user.save }.to change(User, :count).by(0)
      end
    end
  end

  describe "instance methods" do
    context ".check_permission?" do
      let(:user) { create(:user) }
      let(:permission) { create(:permission, value: false) }

      it "returns permission granted to user" do
        Permission.grant_permission_to_user({ action: permission.action, value: permission.value }, user)
        expect(user.check_permission?(permission.action)).to eq(false)
      end
    end
  end
end
