class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :title, :content, :stars, :tag, :image
  belongs_to :user
  has_many :comments

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
