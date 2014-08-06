class AddSlugToRegion < ActiveRecord::Migration

  class Region < ActiveRecord::Base
  end

  def change
    add_column :regions, :slug, :string, index: true

    Region.all.each do |region|
      region.slug = region.name.parameterize
      region.save
    end
  end
end
