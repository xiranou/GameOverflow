require 'faker'

user = User.create(handle: "test", email: "test@gmail.com", password: "test")

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

20.times do
  Article.create(
    title: Faker::Lorem.word,
    content: Faker::Lorem.paragraph,
    author: user,
    topics: Topic.all
    )
end

Article.all.each do |article|
  article.comments.create(text: Faker::Lorem.paragraph, commenter: user)
end
