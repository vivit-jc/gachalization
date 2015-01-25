class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.references :player
      t.integer :pt, default: 0

      t.timestamps
    end
  end
end
