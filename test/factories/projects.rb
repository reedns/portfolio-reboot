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

  factory :broken_url, class: :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url 'www.google.com'
    tech { Faker::Lorem.words(2).join }
  end

  factory :broken_url2, class: :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url 'google.com'
    tech { Faker::Lorem.words(2).join }
  end

end
