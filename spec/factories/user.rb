FactoryGirl.define do
  factory :user do
    sequence(:handle){|n| "user#{n}"}
    sequence(:email){|n| "user#{n}@gamil.com"}
    password 123456
    about Faker::Lorem.paragraph
  end
end