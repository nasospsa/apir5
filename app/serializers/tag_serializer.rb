class TagSerializer < ActiveModel::Serializer
  attributes :id, :key, :post_count, :created_at

  def post_count
    object.posts.length
  end
end
