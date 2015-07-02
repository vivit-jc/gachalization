class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.integer :player_id
      t.integer :opp_id
      t.string :subject
      t.text :text
      t.boolean :read, default: false
      t.boolean :accepted
      t.string :ltype

      t.timestamps
    end
  end
end
