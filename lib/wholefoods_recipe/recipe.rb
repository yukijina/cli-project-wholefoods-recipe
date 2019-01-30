class WholefoodsRecipe::Recipe
  attr_accessor :recipe_name, :recipe_url
  @@all = []

  def initialize(recipe_name, recipe_url)
    @recipe_name = recipe_name
    @recipe_url = recipe_url
    @@all << self
  end

  def self.all
    @@all
  end

end
