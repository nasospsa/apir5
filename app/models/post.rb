class Post < ApplicationRecord
	belongs_to :category
	has_many :tag_posts, inverse_of: :post, dependent: :destroy
	has_many :tags, through: :tag_posts
	accepts_nested_attributes_for :tags
end
