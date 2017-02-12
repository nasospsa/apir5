class Post < ApplicationRecord
	belongs_to :category
	has_many :tag_posts
	has_many :tags, through: :tag_posts
end
