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
     #@user_select = WholefoodsRecipe::Category.all[index].title
     @user_select = WholefoodsRecipe::Category.all[index]
     puts "You selected #{input}.#{@user_select.title}!"
     WholefoodsRecipe::Scraper.scraper_recipes(@user_select.url)
     
     display_link
   elsif
     input.downcase == "exit"
     goodbye
   elsif
     input.to_i <= 0 || input.to_i > WholefoodsRecipe::Category.all.size
     puts "Invalid number"
     select_number
   end
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
