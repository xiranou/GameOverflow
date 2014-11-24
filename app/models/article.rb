class Article < ActiveRecord::Base
  validates_presence_of :title, :content, :author_id
  belongs_to :discussable, polymorphic: true
  has_many :comments
  has_many :votes, as: :voteable
  belongs_to :author, class_name: "User"

  def content_preview
  	self.content.split("")[1..20].join.concat("...")
  end

  def self.recent
  	self.all.order('created_at DESC').limit(5)
  end

  def self.popular
  	
  end

end