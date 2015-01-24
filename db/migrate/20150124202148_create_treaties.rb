class CreateTreaties < ActiveRecord::Migration
  def change
    create_table :treaties do |t|
      t.integer :player_id
      t.integer :opp_id
      t.string :name
      t.text :text
      t.boolean :commerce

      t.timestamps
    end
  end
end
