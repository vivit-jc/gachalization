class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.references :player
      t.integer :exp, default: 0
      t.integer :pt, default: 6
      t.integer :max, default: 6
      t.integer :damage, default: 0

      t.timestamps
    end
  end
end
