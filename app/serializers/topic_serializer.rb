class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :user, :posts_count
end
