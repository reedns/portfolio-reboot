FactoryGirl.define do
  factory :contact do
    name { Faker::Lorem.words(1).join }
    email { Faker::Internet.email }
    body { Faker::Lorem.words(15).join(' ') }
  end
end
