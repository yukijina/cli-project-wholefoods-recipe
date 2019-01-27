class Scraper

  def self.scraper_category
    doc = Nokogiri::HTML(open('https://www.wholefoodsmarket.com/recipe-collections'))

    doc.css(".recipe-item").each do |collection|
      title = collection.css("h3").text
      url = "https://www.wholefoodsmarket.com" + collection.css("h3 a").attr("href")
      recipe = Recipe.new(title, url)
    end
  end

end
