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


Game.create(title: "Left 4 Dead")
Game.create(title: "Assassin's Creed: Revelations")

Genre.create(name: "RPG")
Genre.create(name: "Shooter")
Genre.create(name: "Sport")
Genre.create(name: "Action")
Genre.create(name: "Adventure")
Genre.create(name: "Arcade")
Genre.create(name: "Fighting")
Genre.create(name: "Racing")
Genre.create(name: "Strategy")
Genre.create(name: "Puzzle & Cards")
Genre.create(name: "Other")

Console.create(name: "PS4")
Console.create(name: "PS3")
Console.create(name: "Wii U")
Console.create(name: "Xbox One")
Console.create(name: "Xbox 360")
Console.create(name: "PC")
Console.create(name: "Mobile")
Console.create(name: "Vita")
Console.create(name: "3DS")

