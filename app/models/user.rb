class User < ActiveRecord::Base
	has_secure_password
 	validates_presence_of :handle, :email, :password_digest
 	validates_uniqueness_of :handle, :email
 	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

 	has_many :articles, foreign_key: :author_id
 	has_many :comments,foreign_key: :commenter_id
 	has_many :votes, foreign_key: :voter_id
  has_many :voted_articles, through: :votes, source_type: "Article"
  has_many :voted_comments, through: :votes, source_type: "Comment"

end