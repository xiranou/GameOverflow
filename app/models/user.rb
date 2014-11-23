class User < ActiveRecord::Base
	has_secure_password
 	validates_presence_of :handle, :email, :password_digest
 	validates_uniqueness_of :handle, :email

 	has_many :articles, foreign_key: :author_id
 	has_many :comments,foreign_key: :commenter_id
 	has_many :votes, foreign_key: :voter_id
end