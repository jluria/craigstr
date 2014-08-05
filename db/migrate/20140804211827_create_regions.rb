class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
