class Post < ApplicationRecord
    # Associations
    belongs_to :user
    belongs_to :topic
    has_many :comments, dependent: :destroy
    has_many :stars, dependent: :destroy

    # has_one association with ActiveStorage::Attachment to help us store the post image 
    has_one_attached :image 

    # Rank posts by stars
    scope :stars_ranked, -> {
        order('stars_count DESC')
    }

    # Rank posts by comments
    scope :comments_ranked, -> {
        order('comments_count DESC')
    }
    
    # pagination using the kaminari gem
    paginates_per 10
end
