require 'faker'

User.create(handle: Faker::Name.first_name, email: "test@gmail.com", password: "test")

user = User.first



games = ["Left 4 Dead", "Assassin's Creed: Revelations", "Battlefield 4", "Far Cry 3", "Castlevania", "Wolf Among Us", "BioShock", "Dark Souls", "Fallout 3", "Devil May Cry"]

games.each do |game|
  Game.find_or_create_by(title: game)
end

genres = ["RPG", "Shooter", "Sport", "Action", "Adventure", "Arcade", "Fighting", "Racing", "Strategy", "Puzzle & Cards", "Other"]

genres.each do |genre|
  Genre.find_or_create_by(name: genre)
end

consoles = ["PS3", "PS4", "Wii U", "Xbox One", "Xbox 360", "PC", "Vita", "3DS", "Mobile"]

consoles.each do |console|
  Console.find_or_create_by(name: console)
end



all_games = Game.all

all_games.each do |game|
  game.update(console: Console.find(rand(1..Console.count)))
  game.update(genre: Genre.find(rand(1..Genre.count)))
end

discussables = Console.all + Game.all + Genre.all
discussables.each do |discussable|
  Topic.find_or_create_by(discussable: discussable)
end

topics = Topic.all
20.times do
  Article.create!(title: Faker::Commerce.product_name, content: Faker::Lorem.paragraph, author: user, topics: topics.sample(2))
end

Article.all.each do |article|
  article.comments.create(text: Faker::Lorem.paragraph, commenter: user)
end


