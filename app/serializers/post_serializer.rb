class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published, :created, :category, :tags

  def category
    object.category && CategorySerializer.new(object.category)
  end

  def created
    object.created_at && object.created_at.strftime('%Y-%m-%d')
  end
end
