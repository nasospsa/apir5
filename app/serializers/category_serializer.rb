class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published
end
