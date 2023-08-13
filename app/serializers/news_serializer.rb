class NewsSerializer < ActiveModel::Serializer
  attributes :id, :url, :image, :source, :content
end
