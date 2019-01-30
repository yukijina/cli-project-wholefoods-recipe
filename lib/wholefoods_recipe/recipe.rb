class WholefoodsRecipe::Recipe
  attr_accessor :title, :description, :ingredients
  @@all = []

  def initialize(title, description, ingredients)
    @title = title
    @description = description
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

end
