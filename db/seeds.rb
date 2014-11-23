require 'faker'

user = User.create(handle: "test", email: "testing@gmail.com", password: "test")

10.times do
  Article.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, author: user)
end

Article.all.each do |article|
  article.comments.create(text: Faker::Lorem.paragraph, commenter: user)
end
