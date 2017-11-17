class Category < ApplicationRecord
  validates :name, presence: true
  validates :bjcp_number, uniqueness: true, presence: true

  has_many :subcategories, dependent: :destroy
end
