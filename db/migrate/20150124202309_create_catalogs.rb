class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.references :player
      t.integer :resource_id

      t.timestamps
    end
  end
end
