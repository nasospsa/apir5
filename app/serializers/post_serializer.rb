class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published, :created, :category

  def category
    object.category ? CategorySerializer.new(object.category) : 'N/A'
  end

  def created
    object.created_at.strftime('%Y-%m-%d')
  end
end
