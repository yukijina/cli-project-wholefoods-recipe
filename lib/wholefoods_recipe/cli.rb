class WholefoodsRecipe::CLI

 def call
   puts "Welcome to Wholfoods Recipe Collection!!!"
   puts ""
   puts "               #      #          "
   puts "          #    # #   # #    #    "
   puts "          # #  #  # #  #  # #    "
   puts "           # #  #  #  # #  #     "
   puts "            # #  #  #  #  #      "
   puts "             #  #   #  #  #      "
   puts "             # # # # # # # #     "
   puts "           ##               ##   "
   puts "          #                   #  "
   puts "         #                     # "
   puts "         #     # #    # #      # "
   puts "         #    #   #  #   #     # "
   puts "         #     #    #   #      # "
   puts "         #      #      #       # "
   puts "          #       #   #       #  "
   puts "           #        #        #   "
   puts "          　 #             #     "
   puts "         　    ##       ##       "
   puts "                   ###          "
   puts ""
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
   puts ""
   select_number
 end

 def select_number
   puts "Please type the number you are interested in or type exit: "
   input = gets.strip
   if input.to_i <= WholefoodsRecipe::Category.all.size && input.to_i > 0
     index = input.to_i-1
     @user_input = WholefoodsRecipe::Category.all[index]
     puts ""
     puts "Here is the recipes for No.#{input} #{@user_input.title}!"
     WholefoodsRecipe::Scraper.scraper_recipes(@user_input.url)
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
   WholefoodsRecipe::Recipe.all.each.with_index(1) do |recipe, index|
     puts "#{index}. #{recipe.name}"
   end
   select_recipe
 end

 def select_recipe
   puts ""
   puts "Please type the number to see the recipe or type menu to go back to the categories or exit: "
   input = gets.strip
   if input.to_i <= WholefoodsRecipe::Recipe.all.size && input.to_i > 0
     index = input.to_i-1

     @user_select = WholefoodsRecipe::Recipe.all[index]
     puts "Here is the recipe for #{input}.#{@user_select.name}!!"
     WholefoodsRecipe::Scraper.scraper_recipe_details(@user_select)
     display_recipe_details
   elsif
     input.downcase == "menu"
     WholefoodsRecipe::Recipe.all.clear
     display_category
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
   WholefoodsRecipe::Recipe.all.each do |recipe_details|
     @recipe_name = recipe_details.name
     @recipe_description = recipe_details.description if recipe_details.description != nil
     @recipe_ingredients = recipe_details.ingredients if recipe_details.ingredients != nil
   end

   puts "********************************************************"
   puts ""
   puts "*** #{@recipe_name} ***"
   puts ""
   puts "~~ #{@recipe_description} ~~"
   puts ""
   puts "* What you need: "
        @recipe_ingredients.each.with_index(1) do |ingredient, index|
          puts "#{index}. #{ingredient}"
        end
   puts ""
   puts "Enjoy cooking!!!"
   puts ""
   puts "********************************************************"
   go_back?
 end

 def go_back?
   puts "Would you like to go back to the list of #{@user_input.title}[y/n]? Or type menu or exit: "
   answer = gets.strip.downcase
   if answer == "yes" || answer == "y"
     puts "OK! Here you go!!"
     display_recipes
   elsif answer == "no" ||  answer == "n"
     goodbye
   elsif answer == "menu"
     WholefoodsRecipe::Recipe.all.clear
     display_category
   elsif answer == "exit"
     goodbye
   else
     puts "Invalid."
     go_back?
   end
 end

 def goodbye
   puts "Thanks for visiting my project!!!"
 end

end
