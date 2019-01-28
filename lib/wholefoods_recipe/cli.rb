class CLI

 def call
   puts "Welcome to Wholfoods Recipe CLI!!!"
   list_category
 end

 def list_category
   puts "Please type list to see recipe categories or type exit: "
   input = nil
   input = gets.strip
   if input == "list"
     puts "(It takes moments to diplay the list. Thanks for your patient!!)"
     Scraper.scraper_category
     Scraper.scraper_recipe
     Category.all.each.with_index(1) do |list, index|
       puts "#{index}. #{list.title}"
     end
     list
   elsif input == "exit"
     goodbye
   else
     list_category
   end
 end

 def list
   puts "Please type the number you are interested in or type exit: "
   input = gets.strip
   if input.to_i <= Category.all.size && input.to_i > 0
     index = input.to_i-1
     category_title = Category.all.map{|category| category.title}
     @user_select = category_title[index]
     puts "You selected #{input}.#{@user_select}!"
     puts "Here is the recipe we have:"
     display
   elsif
     input == "exit"
     goodbye
   elsif
     input.to_i == 0
     list
   end
 end

 def display
   Recipe.all.each do |recipe|
     if recipe.title == @user_select
       puts "#{recipe.name}"
     end
   end
   list_details
 end

 def list_details
   puts "Please type recipe name you like: "
   input = gets.strip.gsub(/[":","\,"]/, "")
   puts "You selected #{input}."
   puts "Do you want to open the recipe link [y/n]?"
   answer = gets.strip.downcase
   if answer == "yes" || answer == "y"
     puts "OK,here you go!!"
     selected_recipe = Recipe.all.find {|recipe| recipe.name.downcase == input.downcase }
     system("open #{selected_recipe.url}")
   elsif answer == "no" || answer == "n"
     puts "Would you like to choose another recipe [y/n]?"
     final_answer = gets.strip
     if final_answer == "yes" || final_answer == "y"
       list_details
     else
       goodbye
     end
   else
      goodbye
   end
 end

 def goodbye
   puts "Thanks for visiting my project!!!"
 end

end
