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

  describe "Permission" do
    context "when create" do
      it "valid data" do
        perm = build(:permission)
        expect { perm.save }.to change(Permission, :count).by(1)
      end

      it "invalid data" do
        first = create(:permission, action: "C:/readme.txt")
        permission = build(:permission, action: first.action)
        expect { permission.save }.to change(Permission, :count).by(0)
      end
    end
  end

  describe "instance methods" do
    context ".action_check?" do
      it "there is permission" do
        permission = create :permission
        expect(Permission.action_check?(action: permission.action, value: true)).to eq(false)
      end

      it "no permission" do
        permission = build :permission
        expect(Permission.action_check?(action: permission.action, value: true)).to eq(true)
      end
    end

    context "when grant permission to user" do
      let(:user) { create(:user) }

      it "already has permission for user" do
        permission = create :permission
        Permission.grant_permission_to_user({ action: permission.action, value: true }, user)
        expect(user.permissions.size).to eq(1)
      end

      it "new permission success create with user" do
        permission = build :permission
        Permission.grant_permission_to_user({ action: permission.action, value: true }, user)
        expect(user.permissions.size).to eq(1)
      end
    end

    context "when grant permission to role" do
      let(:user) { create(:user) }
      let(:role) { create(:role, user: user) }

      it "already has permission for role" do
        permission = create :permission
        Permission.grant_permission_to_user({ action: permission.action, value: true }, role)
        expect(role.permissions.size).to eq(1)
      end

      it "new permission success create with role" do
        permission = build :permission
        Permission.grant_permission_to_user({ action: permission.action, value: true }, role)
        expect(role.permissions.size).to eq(1)
      end
    end
  end
end
