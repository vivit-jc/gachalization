class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :player
      t.integer :data_id
      t.integer :level
      t.integer :exp
      t.boolean :sleep

      t.timestamps
    end
  end
end
