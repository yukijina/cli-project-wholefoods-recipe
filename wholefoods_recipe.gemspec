
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wholefoods_recipe/version"

Gem::Specification.new do |spec|
  spec.name          = "wholefoods_recipe"
  spec.version       = WholefoodsRecipe::VERSION
  spec.authors       = ["yukijina"]
  spec.email         = ["yukijina@gmail.com"]

  spec.summary       = "CLI for wholefoods a recipe collection"
  spec.description   = "Scrapes a recipe collection from https://www.wholefoodsmarket.com/recipe-collections"
  spec.homepage      = "https://github.com/yukijina/cli-project-wholefoods-recipe"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    #spec.metadata["homepage_uri"] = spec.homepage
    #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["wholefoods_recipe"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
