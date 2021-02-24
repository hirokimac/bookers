class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy
         has_many :book_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy
         
         attachment :profile_image

         has_many :relationships, dependent: :destroy
         has_many :followings, through: :relationships, source: :follow

         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
         has_many :followers, through: :reverse_of_relationships, source: :user

         validates :name, presence: true
         validates :name, length: { in: 2..20 }
         validates :email, presence: true
         validates :introduction, length: { maximum: 50 }

         def follow(other_user)
          unless self == other_user
            self.relationships.find_or_create_by(follow_id:other_user.id)
         end
         end

         def unfollow(other_user)
          relationships = self.relationships.find_by(follow_id: other_user.id)
          relationships.destroy
         end

         def following?(other_user)
          self.followings.include?(other_user)
         end

end
