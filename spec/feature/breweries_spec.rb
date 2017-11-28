require 'rails_helper'

RSpec.feature "Manage Brewery" do
  background do
    create :subcategory, name: "Pale Ale"
  end

  scenario "Add a brewery with a beer" do
    visit breweries_path
    click_on "New Brewery"

    fill_in "Name", with: "Brewdog"

    click_on "Save"

    click_on "Add Beer"
    fill_in "Name", with: "Punk IPA"
    click_on "Save"

    within "table" do
      expect(page).to have_content "Punk IPA"
    end
  end
end
