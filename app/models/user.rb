class User < ActiveRecord::Base
  has_many :posts
  has_many :spams
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def not_flagged_as_spam?(post)
    spams.where(post: post).empty?
  end
end
