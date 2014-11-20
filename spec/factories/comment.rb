FactoryGirl.define do
  factory :comment do
    sequence(:text){|n| "test comment text #{n}"}
  end
end