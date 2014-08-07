class User < ActiveRecord::Base
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def posted?(post)
    post.user_id == id 
  end
end
