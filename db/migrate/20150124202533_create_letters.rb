class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.integer :player_id
      t.integer :opp_id
      t.text :text
      t.boolean :read
      t.boolean :treaty

      t.timestamps
    end
  end
end
