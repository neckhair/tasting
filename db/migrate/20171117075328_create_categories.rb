class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :bjcp_number
      t.string :name
      t.text :notes

      t.timestamps

      t.index :bjcp_number
    end
  end
end
