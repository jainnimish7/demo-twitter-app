class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :followers, class_name: 'Following', foreign_key: 'user_id'
  has_many :following, class_name: 'Following', foreign_key: 'follower_id'

  # checking if user is follwing or not
  def user_following?(current_user_id, user)
    User.find_by_id(current_user_id).following.where(user_id: user.id).length.zero? ? false : true
  end
end
