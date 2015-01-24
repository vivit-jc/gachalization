class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.references :player
      t.integer :exp
      t.integer :pt
      t.integer :max
      t.integer :damage

      t.timestamps
    end
  end
end
