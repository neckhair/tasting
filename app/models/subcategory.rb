class Subcategory < ApplicationRecord
  default_scope -> { order(:bjcp_number) }

  belongs_to :category

  validates :name, presence: true
  validates :bjcp_number, uniqueness: true, presence: true

  def fullname
    "#{name} (#{bjcp_number})"
  end
end
