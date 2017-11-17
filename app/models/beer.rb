class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :subcategory

  validates :name, presence: true

  delegate :category, to: :subcategory
end
