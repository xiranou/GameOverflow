FactoryGirl.define do
  factory :article do
    title "I LUV GAMES"
    content "THEY ARE COOL!!!!!1!1!1!111"
  end

  factory :notitle_article do
    title
    content "THEY ARE COOL!!!!!1!1!1!111"
  end

  factory :nocontent_article do
    title "I LUV GAMES"
    content
  end
end
