FactoryGirl.define do
  factory :game do
    sequence(:title){|n| "Action #{n}"}
  end

  factory :invalid_game do
    name nil
  end
end