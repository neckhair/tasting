class AddCountryCodeToBreweries < ActiveRecord::Migration[5.1]
  def change
    add_column :breweries, :country_code, :string, limit: 3
  end
end
