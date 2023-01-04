class Topic < ApplicationRecord
    # Associations
    belongs_to :user, dependent: :destroy
    has_many :posts, dependent: :destroy

end
