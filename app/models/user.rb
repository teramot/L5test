class User < ApplicationRecord
  #TODO: validates
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
