class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :username, :bio, :stars, :profile_picture, :created_at, :updated_at,
    def profile_picture
        object.profile_picture.url if object.profile_picture.attached?
    end
end
