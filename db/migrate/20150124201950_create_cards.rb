class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :player
      t.integer :data_id
      t.integer :level, default: 1
      t.integer :exp, default: 0
      t.boolean :sleep, default: false

      t.timestamps
    end
  end
end
