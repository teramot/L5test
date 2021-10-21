class User < ApplicationRecord
  #TODO: validates
  validates :uid, uniqueness: true, presence: true
  
  def password=(val)
    if val.present?
      self.pass = BCrypt::Password.create(val)
    end
    @password = val
  end
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet
  validates :password, presence: true, confirmation: true
  attr_accessor :password, :password_confirmation
end
