class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: JwtDenylist

         # Validations
         validates :username, presence: true
         validates :username, uniqueness: true

         # Associations
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy

end