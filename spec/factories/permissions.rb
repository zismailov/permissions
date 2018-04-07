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

FactoryBot.define do
  factory :permission do
    action { Faker::Lorem.word }
    value  true
  end
end
