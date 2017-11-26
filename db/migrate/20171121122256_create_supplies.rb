class CreateSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies do |t|
      t.references :beer, foreign_key: true
      t.references :supplier, foreign_key: true
      t.integer :price_cents

      t.timestamps
    end
  end
end
