class Topic < ApplicationRecord
    attr_readonly :user_id # Topic author cannot be edited

    # Validations 
    validates :name, uniqueness: true

    # Associations
    belongs_to :user, dependent: :destroy
    has_many :posts, dependent: :destroy

end
