FactoryGirl.define do
  factory :console do
    sequence(:name){|n| "PS#{n}"}
  end

  factory :invalid_console do
    name nil
  end
end