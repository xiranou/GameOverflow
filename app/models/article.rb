class Article < ActiveRecord::Base
  validates_presence_of :title, :content, :author_id

  has_many :comments
  has_many :votes, as: :voteable
  belongs_to :author, class_name: "User"

  has_many :topics
  has_many :genre_topics, through: :topics, source: :discussable, source_type: "Genre"
  has_many :game_topics, through: :topics, source: :discussable, source_type: "Game"
  has_many :console_topics, through: :topics, source: :discussable, source_type: "Console"

  def content_preview
  	self.content.split("")[1..20].join.concat("...")
  end

  # Check out how to create scopes with AR.
  def self.recent
  	self.all.order('created_at DESC').limit(5)
  end

  def self.popular
  	self.all.order('vote_count DESC').limit(5)
  end

end
