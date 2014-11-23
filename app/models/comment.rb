class Comment < ActiveRecord::Base
  validates_presence_of :text, :commenter_id

  belongs_to :article

  belongs_to :parent, class_name: "Comment"
  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  has_many :votes, as: :voteable

  belongs_to :commenter, class_name: "User"
end