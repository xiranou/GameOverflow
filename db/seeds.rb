require 'faker'

10.times do
  Article.create(title: Faker::Lorem.word, content: Faker::Lorem.paragraph)
end

Article.all.each do |article|
  article.comments.create(text: Faker::Lorem.paragraph)
end
