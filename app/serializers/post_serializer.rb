class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tag, :created_at, :updated_at, :user, :image, :stars_count

  def image
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
  end

end
