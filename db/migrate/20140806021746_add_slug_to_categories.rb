class AddSlugToCategories < ActiveRecord::Migration
  class Category < ActiveRecord::Base
  end

  def change
    add_column :categories, :slug, :string, index: true

   Category.all.each do |category|
     category.slug = category.name.parameterize
     category.save
   end
  end
end
