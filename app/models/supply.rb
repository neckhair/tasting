class Supply < ApplicationRecord
  belongs_to :beer
  belongs_to :supplier

  monetize :price_cents, as: :price

  validates :supplier, uniqueness: { scope: :beer_id }
end
