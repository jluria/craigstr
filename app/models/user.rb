class User < ActiveRecord::Base
  has_many :posts
  has_many :spams
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

<<<<<<< HEAD
  def not_flagged_as_spam?(post)
    spams.where(post: post).empty?
=======
  def can_change?(post)
    admin? || posted?(post)
  end

  private
  
  def posted?(post)
    post.user_id == id
>>>>>>> aa-admin-delete
  end
end
