class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.references :player
      t.integer :x
      t.integer :y
      t.string :name

      t.timestamps
    end
  end
end
