class Category < ApplicationRecord
  default_scope -> { order(:bjcp_number) }

  validates :name, presence: true
  validates :bjcp_number, uniqueness: true, presence: true

  has_many :subcategories, dependent: :destroy
end
