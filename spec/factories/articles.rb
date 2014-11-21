FactoryGirl.define do
  factory :article do
    title "I LUV GAMES"
    content "THEY ARE COOL!!!!!1!1!1!111"
  end

  factory :invalid_article do
    title nil
    content "THEY ARE COOL!!!!!1!1!1!111"
  end


end
