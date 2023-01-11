class Post < ApplicationRecord
    attr_readonly :user_id # Post author cannot be edited

    # Associations
    belongs_to :user
    belongs_to :topic, counter_cache: true
    has_many :comments, dependent: :destroy
    has_many :stars, dependent: :destroy

    # has_one association with ActiveStorage::Attachment to help us store the post image 
    has_one_attached :image 

    # Rank posts by number of stars
    scope :stars_ranked, -> {
        order('stars_count DESC')
    }

    # Rank posts by number of comments
    scope :comments_ranked, -> {
        order('comments_count DESC')
    }
    
    # pagination using the kaminari gem
    paginates_per 10
end
