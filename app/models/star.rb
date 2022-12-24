class Star < ApplicationRecord
  # Associations
  belongs_to :post, counter_cache: true
  belongs_to :user

  # Validations
  validates :user_id, uniqueness: { scope: :post_id }

end
