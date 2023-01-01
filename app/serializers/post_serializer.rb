class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tag, :created_at, :updated_at, :user, :image, :stars_count

  def user
    user = object.user.as_json
    user[:profile_picture] = object.user.profile_picture.url
    return user 
  end

  def image
    object.image.url if object.image.attached?
  end

end
