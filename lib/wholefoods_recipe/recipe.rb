class WholefoodsRecipe::Recipe
  attr_accessor :name, :description, :ingredients
  @@all = []

  def initialize(name, description, ingredients)
    @name = name
    @description = description
    @ingredients = ingredients
    @@all << self
  end

  def self.all
    @@all
  end

end
