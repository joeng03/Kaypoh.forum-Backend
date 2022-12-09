class Post < ApplicationRecord
    # Associations
    belongs_to :user
    has_many :comments, dependent: :destroy

    # has_one association with ActiveStorage::Attachment to help us store the post image 
    has_one_attached :image
end
