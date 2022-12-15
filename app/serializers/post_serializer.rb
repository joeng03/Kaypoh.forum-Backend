class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :stars, :tag, :image, :created_at, :updated_at, :user
  belongs_to :user
  has_many :comments

  def image
    Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
