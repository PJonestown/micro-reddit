class User < ActiveRecord::Base
	validates :username, presence: true, length: { maximum: 25 }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6, maximum: 50 } 
	has_many :posts
	has_many :comments
end