class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true 
  after_create :to_slug

  def to_param
    slug
  end

  private

  def to_slug
   slug = name.parameterize
  end
end
