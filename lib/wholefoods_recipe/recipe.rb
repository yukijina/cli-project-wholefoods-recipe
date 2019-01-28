class Recipe
  attr_accessor :title, :name, :url
  @@all = []

  def initialize(title, name, url)
    @title = title
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
