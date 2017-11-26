class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :subcategory

  has_many :supplies, dependent: :destroy
  has_many :suppliers, through: :supplies

  validates :name, presence: true

  delegate :category, to: :subcategory
end
