class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.decimal :abv
      t.integer :ibu
      t.text :notes
      t.references :brewery, foreign_key: true

      t.timestamps
    end
  end
end
