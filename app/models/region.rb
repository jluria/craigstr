class Region < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true

  before_create :parameterize_name

  def to_param
    name
  end

  private

  def parameterize_name
    name.parameterize
  end
end
