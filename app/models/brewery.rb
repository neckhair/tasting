class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy

  validates :name, presence: true

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
