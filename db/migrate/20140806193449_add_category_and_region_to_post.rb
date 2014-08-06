class AddCategoryAndRegionToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :category, index: true
    add_reference :posts, :region, index: true
  end
end
