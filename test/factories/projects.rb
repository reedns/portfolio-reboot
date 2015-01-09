FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url { Faker::Internet.url }
    tech { Faker::Lorem.words(2).join }
  end

  factory :invalid_project, class: :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url { Faker::Internet.url }
  end
end
