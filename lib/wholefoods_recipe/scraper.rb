class Scraper

  def self.scraper_category
    doc = Nokogiri::HTML(open('https://www.wholefoodsmarket.com/recipe-collections'))

    doc.css(".recipe-item").each do |collection|
      title = collection.css("h3").text
      url = "https://www.wholefoodsmarket.com" + collection.css("h3 a").attr("href")
      recipe = Category.new(title, url)
    end
  end

  def self.scraper_recipe
    binding.pry
    urls = Category.all.map {|category| category.url}

    urls.each do |url|
      doc = Nokogiri::HTML(open(url))

      if doc.css(".he-recipes")
        title = doc.css(".field-content h2").text
        doc.css(".he-recipes").each do |data|
          name = data.css("p a").text
          url = "https://www.wholefoodsmarket.com" + data.css("p a").attr("href")
        end
      elsif doc.css(".views-row")
        title = doc.css(".field-content h2").text
        doc.css(".views-field-title").each do  |data|
          name = data.css("a").text
          url = "https://www.wholefoodsmarket.com" + data.css("a").attr("href")
        end
      end

    end
   end

end
