FactoryGirl.define do
  factory :admin do
    username { Faker::Name.name }
    password { Faker::Lorem.words(1).join }
  end

end
