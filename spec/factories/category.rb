FactoryBot.define do
  factory :category do
    name "American Strong Ales"
    bjcp_number 1
  end

  factory :subcategory do
    name "IPA"
    category
    bjcp_number "1A"
  end
end
