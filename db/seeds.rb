require 'faker'

User.create(handle: "test", email: "test@gmail.com", password: "test")
user = User.first

["xbox-one","ps4","wii-u"].each do |console|
  Console.find_or_create_by(name: console)
end

consoles = Console.all

consoles.each do |console|
  console.games.create(title: Faker::App.name, genre: Genre.create(name: Faker::Hacker.verb))
end

discussables = Console.all + Game.all + Genre.all
discussables.each do |discussable|
  Topic.find_or_create_by(discussable: discussable)
end

topics = Topic.all
20.times do
  Article.create!(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, author: user, topics: topics.sample(2))
end

Article.all.each do |article|
  article.comments.create(text: Faker::Lorem.paragraph, commenter: user)
end