class CommentSerializer < ActiveModel::Serializer
    attributes :id, :post_id, :content, :created_at, :updated_at, :user
  end
  