class AddSubcategoryToBeers < ActiveRecord::Migration[5.1]
  def change
    add_reference :beers, :subcategory, foreign_key: true
  end
end
