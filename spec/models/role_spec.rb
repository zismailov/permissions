# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Role, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:permissions).through(:permission_roles) }
    it { is_expected.to belong_to :user }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :name }
  end

  describe "Role" do
    context "when create" do
      it "valid data" do
        user = create(:user)
        role = build(:role, user: user)
        expect { role.save }.to change(Role, :count).by(1)
      end

      it "invalid data" do
        role = build(:role, user: nil)
        expect { role.save }.to change(Role, :count).by(0)
      end
    end
  end

  describe "instance methods" do
    context ".check_permission?" do
      let(:user) { create(:user) }
      let(:role) { create(:role, user: user) }
      let(:permission) { create(:permission) }

      it "return role permission if user permission is not set" do
        Permission.grant_permission_to_user({ action: permission.action, value: true }, role)
        expect(user.check_permission?(permission.action)).to eq(true)
      end
    end
  end
end
