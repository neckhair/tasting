class Supplier < ApplicationRecord
  validates :name, presence: true

  has_many :supplies, dependent: :destroy
  has_many :beers, through: :supplies
end
