require 'rails_helper'

RSpec.feature "Manage Supplier" do
  background do
    supplier = create :supplier, name: 'Beer Shop'
    beer = create :beer, name: 'IPA'
    create :supply, beer: beer, supplier: supplier, price: 3.50
  end

  scenario "show the supplier's beers" do
    visit suppliers_path
    click_on 'Beer Shop'

    expect(page).to have_content "IPA"
    expect(page).to have_content "3.50"
  end
end
