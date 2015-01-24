class CreatePrivateLogs < ActiveRecord::Migration
  def change
    create_table :private_logs do |t|
      t.references :player
      t.string :text
      t.boolean :read

      t.timestamps
    end
  end
end
