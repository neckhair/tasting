require 'open-uri'
require 'nokogiri'

STYLEGUIDE_URL = "https://raw.githubusercontent.com/meanphil/bjcp-guidelines-2015/master/styleguide.xml".freeze

namespace :bjcp do
  desc "Load BJCP styles into database"
  task import_styles: :environment do
    doc = Nokogiri::HTML(open(STYLEGUIDE_URL))
    doc.xpath("//class[@type='beer']/category").each do |category_node|
      category_name = category_node.xpath("name").text.chomp
      puts "-> #{category_name}"

      category = Category.find_or_create_by bjcp_number: category_node["id"] do |category|
        category.name = category_name
        category.notes = category_node.xpath("notes").text.chomp
      end

      category_node.xpath("subcategory").each do |subcategory_node|
        subcategory_name = subcategory_node.xpath("name").text.chomp
        puts "     #{subcategory_name}"
        category.subcategories.find_or_create_by bjcp_number: subcategory_node["id"] do |subcategory|
          subcategory.name = subcategory_name
        end
      end
    end
  end
end
