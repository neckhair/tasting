class Subcategory < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :bjcp_number, uniqueness: true, presence: true
end
