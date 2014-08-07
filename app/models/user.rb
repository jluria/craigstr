class User < ActiveRecord::Base
  has_many :posts
  has_many :spams
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def flagged(post)
    spams.where(post: post, user: self).any?
  end
end
