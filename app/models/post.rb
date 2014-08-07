class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :region
  belongs_to :category
  has_many :spam
end
