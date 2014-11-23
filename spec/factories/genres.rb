FactoryGirl.define do
  factory :genre do
    sequence(:name){|n| "A new genre #{n}"}
  end

  factory :invalid_genre do
    name nil
  end
end