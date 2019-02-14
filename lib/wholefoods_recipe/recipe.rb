class WholefoodsRecipe::Recipe
  attr_accessor :name, :url, :description, :ingredients
  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def set_additonal_attribute(description, ingredients)
    @description = description
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

end
