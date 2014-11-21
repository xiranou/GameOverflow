require 'faker'

10.times do
  Comment.create(text: Faker::Lorem.paragraph)
end