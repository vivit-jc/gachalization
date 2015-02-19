class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.references :player
      t.integer :card_id
      t.integer :price

      t.timestamps
    end
  end
end
