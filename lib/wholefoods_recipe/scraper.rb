class WholefoodsRecipe::Scraper

  def self.scraper_category
    doc = Nokogiri::HTML(open('https://www.wholefoodsmarket.com/recipe-collections'))

    doc.css(".recipe-item").each do |collection|
      title = collection.css("h3").text.strip
      url = "https://www.wholefoodsmarket.com" + collection.css("h3 a").attr("href")
      WholefoodsRecipe::Category.new(title, url)
    end
  end

  def self.scraper_recipes(url)
    doc = Nokogiri::HTML(open(url))

    doc.css(".he-recipes p a").each do |element|
      binding.pry
      recipe_name = element.text
      recipe_url = element.attr("href")
      WholefoodsRecipe::Recipe.new(recipe_name, recipe_url)
    end

  end

end
