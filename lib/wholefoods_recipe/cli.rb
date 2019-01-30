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
     display
   elsif input == "exit"
     goodbye
   else
     puts "Invalid."
     list_category
   end
 end

 def display
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
     puts "Here is the details for #{input}.#{@user_select.recipe_name}!"
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
 end

 def display_link
   puts "Would you like to open the link to see more details? [y/n]"
   input = gets.strip.downcase
   if input == "yes" || input == "y"
     puts "Here you go!!"
     WholefoodsRecipe::Category.all.each do |list|
       if @user_select == list.title
         system("open #{list.url}")
       end
     end
   elsif input == "no" ||  input == "n"
     puts "Would you like to select another recipe collection [y/n]?"
     answer = gets.strip.downcase
     if answer == "yes" || answer == "y"
       puts "OK!"
       display
     else
       goodbye
     end
   else
     puts "Invalid."
     display_link
   end
 end

 def goodbye
   puts "Thanks for visiting my project!!!"
 end

end
