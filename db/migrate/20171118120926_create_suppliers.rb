class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :notes
      t.string :url

      t.timestamps
    end
  end
end
