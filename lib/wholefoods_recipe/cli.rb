class WholefoodsRecipe::CLI

 def call
   puts "Welcome to Wholfoods Recipe Collection!!!"
   list_category
 end

 def list_category
   puts "Please type list to see recipe categories or type exit: "
   input = gets.strip.downcase
   if input == "list"
     WholefoodsRecipe::Scraper.scraper_category
     display_category
   elsif input == "exit"
     goodbye
   else
     puts "Invalid."
     list_category
   end
 end

 def display_category
   WholefoodsRecipe::Category.all.each.with_index(1) do |list, index|
     puts "#{index}. #{list.title}"
   end
   select_number
 end

 def select_number
   puts "Please type the number you are interested in or type exit: "
   input = gets.strip
   if input.to_i <= WholefoodsRecipe::Category.all.size && input.to_i > 0
     index = input.to_i-1
     @user_input = WholefoodsRecipe::Category.all[index]
     puts "Here is the details for #{input}.#{@user_input.title}!"
     display_recipes
   elsif
     input.downcase == "exit"
     goodbye
   elsif
     input.to_i <= 0 || input.to_i > WholefoodsRecipe::Category.all.size
     puts "Invalid number"
     select_number
   end
 end

 def display_recipes
   WholefoodsRecipe::Scraper.scraper_recipes(@user_input.url)
   WholefoodsRecipe::Recipes.all.each.with_index(1) do |recipe, index|
     puts "#{index}. #{recipe.recipe_name}"
   end
   select_recipe
 end

 def select_recipe
   puts "Please type the number you are interested in: "
   input = gets.strip
   if input.to_i <= WholefoodsRecipe::Recipes.all.size && input.to_i > 0
     index = input.to_i-1
     @user_select = WholefoodsRecipe::Recipes.all[index]
     puts "Here is the details for #{input}.#{@user_select.recipe_name}!!"
     display_recipe_details
   elsif
     input.downcase == "exit"
     goodbye
   elsif
     input.to_i <= 0 || input.to_i > WholefoodsRecipe::Recipe.all.size
     puts "Invalid number"
     select_recipe
   end
 end

 def display_recipe_details
   WholefoodsRecipe::Scraper.scraper_recipe_details(@user_select.recipe_url)
   WholefoodsRecipe::Recipe.all.each do |recipe_details|
     puts ""
     puts "*** #{recipe_details.title} ***"
     puts ""
     puts "~ #{recipe_details.description} ~"
     puts ""
     puts "What you need: "
     recipe_details.ingredients.each.with_index(1) do |ingredient, index|
       puts "#{index}. #{ingredient}"
     end
   end
   puts ""
   puts "Enjoy cooking!!!"
 end

 def goodbye
   puts "Thanks for visiting my project!!!"
 end

end
