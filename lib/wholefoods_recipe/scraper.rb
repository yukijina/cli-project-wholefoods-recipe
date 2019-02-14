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

    if doc.at_css(".he-recipes")
      doc.css(".he-recipes p a").each do |element|
        if !element.attr("href").include?("blog")
          recipe_name = element.text.strip
          recipe_url = "https://www.wholefoodsmarket.com" + element.attr("href")
        end
        WholefoodsRecipe::Recipe.new(recipe_name, recipe_url) unless recipe_url == nil
      end
    elsif doc.at_css(".he-recipes") == nil
      doc.css("span.field-content a").each do |element|
        if !element.attr("href").include?("blog")
          recipe_name = element.text
          recipe_url = "https://www.wholefoodsmarket.com" + element.attr("href")
        end
        WholefoodsRecipe::Recipe.new(recipe_name, recipe_url) unless recipe_url == nil
      end
    end
  end

  def self.scraper_recipe_details(recipe)
    doc = Nokogiri::HTML(open(recipe.url))

    if xml = doc.at_css(".torn-pod-content")
      #name = xml.css(".views-field-title h1").text
      description = xml.css(".views-field-body").text.strip
      ingredients = doc.css(".field-items ul li").map {|li| li.text.strip}
      recipe.set_additonal_attribute(description, ingredients)
    elsif xml == nil
      #name = doc.css(".title h1").text
      description = doc.css(".main-copy p").first.text
      ingredients = doc.css(".main-copy li").map {|li| li.text.strip}
      recipe.set_additonal_attribute(description, ingredients)
    end
  end

end
