require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative "./wholefoods_recipe/version"
require_relative "./wholefoods_recipe/cli"
require_relative "./wholefoods_recipe/category"
require_relative "./wholefoods_recipe/recipes"
require_relative "./wholefoods_recipe/recipe"
require_relative "./wholefoods_recipe/scraper"



module WholefoodsRecipe
  class Error < StandardError; end
end
