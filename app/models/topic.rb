class Topic < ApplicationRecord
    # Associations
    has_many :posts, dependent: :destroy

end
