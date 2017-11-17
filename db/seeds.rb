Rake::Task["bjcp:import_styles"].invoke

brewery_1 = Brewery.create! name: 'Omnipollo', country_code: 'SE'
brewery_1.beers.create! name: 'Nebuchadnezzar',
                        abv: 8.5, ibu: 100,
                        subcategory: Subcategory.find_by(name: 'Double IPA')

brewery_2 = Brewery.create! name: 'Brewdog', country_code: 'GB'
brewery_2.beers.create! name: 'Punk IPA', abv: 5.6, ibu: 45,
                        subcategory: Subcategory.find_by(name: 'American IPA')
brewery_2.beers.create! name: 'Dead Pony Club', abv: 3.8, ibu: 25,
                        subcategory: Subcategory.find_by(name: 'American Pale Ale')
