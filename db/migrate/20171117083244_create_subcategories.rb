class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :bjcp_number
      t.string :name
      t.references :category, foreign_key: true

      t.timestamps

      t.index :bjcp_number
    end
  end
end
