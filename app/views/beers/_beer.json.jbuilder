json.extract! beer, :id, :name, :abv, :ibu, :notes, :brewery_id, :created_at, :updated_at
json.url beer_url(beer, format: :json)
