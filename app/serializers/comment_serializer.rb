class CommentSerializer < ActiveModel::Serializer
    attributes :id, :post_id, :content, :created_at, :updated_at, :user, :sentiment
    
    def user
      user = object.user.as_json
      user[:profile_picture] = object.user.profile_picture.url
      return user 
    end
  end
  