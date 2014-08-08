class Post < ActiveRecord::Base
  paginates_per 20
  has_attached_file :image,
  styles: { medium: "300x300>", thumb: "100x100>" },
  default_url: "logo.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :region
  belongs_to :category
  has_many :spam
end
