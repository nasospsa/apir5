class PageSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published
end
