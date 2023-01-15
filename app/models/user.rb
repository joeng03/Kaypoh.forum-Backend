class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         :rememberable,
         jwt_revocation_strategy: JwtDenylist

         # Associations
         has_many :topics, dependent: :destroy
         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :stars, dependent: :destroy

         # Validations
         validates :username, presence: true
         validates :username, uniqueness: true
         validates_length_of :username, minimum: 1, maximum: 10, allow_blank: false
         
         # has_one association with ActiveStorage::Attachment to help us store the user profile_picture 
         has_one_attached :profile_picture
end