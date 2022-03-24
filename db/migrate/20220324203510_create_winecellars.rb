class CreateWinecellars < ActiveRecord::Migration[5.2]
  def change
    create_table :winecellars do |t|
      t.string :name
      t.boolean :full, :null => false, :default => false
      t.string :location
      t.integer :capacity

      t.timestamps
    end
  end
end
