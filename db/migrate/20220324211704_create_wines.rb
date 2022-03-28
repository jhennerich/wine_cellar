class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :varietal
      t.integer :quantity
      t.boolean :in_stock, :null => false, :default => false
      t.integer :year
      t.integer :wine_score
      t.references :winecellar, foreign_key: true

      t.timestamps
    end
  end
end
