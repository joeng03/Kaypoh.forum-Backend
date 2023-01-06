class TopicSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :username, :posts_count, :created_at

  def username
    object.user.username
  end

end
