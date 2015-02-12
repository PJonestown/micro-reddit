class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :title, presence: true, length: { maximum: 140 },  uniqueness: { case_sensitive: false }
	validates :body, presence: true
end
