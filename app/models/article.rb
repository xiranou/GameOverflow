class Article < ActiveRecord::Base
  validates_presence_of :title, :content, :author_id
  belongs_to :discussable, polymorphic: true
  has_many :comments
  has_many :votes, as: :voteable
  belongs_to :author, class_name: "User"

  def content_preview

  end

  def recent

  end

  def popular

  end
end