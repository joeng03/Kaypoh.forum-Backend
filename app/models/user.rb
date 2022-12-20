class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: JwtDenylist

         # Associations
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy

         # Validations
         validates :username, presence: true
         validates :username, uniqueness: true
         
         # has_one association with ActiveStorage::Attachment to help us store the user profile_picture 
         has_one_attached :profile_picture
end