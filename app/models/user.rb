class User < ActiveRecord::Base
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def posted?(post)
    posts.include?(post)
  end
end
