FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url { Faker::Internet.url }
    tech { Faker::Lorem.words(2).join }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test/support/image.jpg')) }
  end

  factory :invalid_project, class: :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url { Faker::Internet.url }
  end

  factory :no_http_project, class: :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url 'www.google.com'
    tech { Faker::Lorem.words(2).join }
    image { File.open(File.join(Rails.root, 'test/support/image.jpg')) }
  end

  factory :no_www_project, class: :project do
    name { Faker::Lorem.words(1).join }
    description { Faker::Lorem.words(10).join }
    url 'google.com'
    tech { Faker::Lorem.words(2).join }
    image { File.open(File.join(Rails.root, 'test/support/image.jpg')) }
  end
end
