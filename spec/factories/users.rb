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

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email    { Faker::Internet.email }
  end
end
