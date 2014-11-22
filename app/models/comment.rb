class Comment < ActiveRecord::Base
  validates_presence_of :text

  belongs_to :article

  belongs_to :parent, class_name: "Comment"
  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy
end