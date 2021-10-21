class Tweet < ApplicationRecord
  #TODO: validates
  validates :message, presence: true, length: { minimum: 1, maximum: 140}
  def like(user)
    likes.create(user_id: user.id)
  end
  
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
  
  def liked?(user)
    like_users.include?(user)
  end
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
end
