class User < ActiveRecord::Base
  has_many :posts
  has_many :spams
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def not_flagged(post)
    spams.where(post: post, user: self).empty?
  end
end
