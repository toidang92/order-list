FactoryBot.define do
  factory :user, aliases: [:orderer]  do
    sequence(:email) { |n| "email#{n}_#{Time.current.to_i}@gmail.com" }
    name { Faker::Name.name }
    password { "password"}

    role { User.roles.values.sample }

    after :create, &:confirm
  end
end
