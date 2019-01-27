class CLI

 def call
   puts "Welcome to Wholfoods Recipe CLI!!!"
   list_category

 end

 def list_category
   puts "Please type list to see the categories or exit: "
   input = nil
   input = gets.strip
   if input == "list"
     Scraper.scraper_category
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
     puts "More inforamtion for #{input.to_i}"
   elsif
     input == "exit"
     goodbye
   elsif
     input.to_i == 0
     list
   end
   #1.name of the receipes
   #2.receipe url
   #3.need to get user input
 end

 def goodbye
   puts "Thanks for visiting my project!!!"
 end

 def display_recipe
   #1.title
   #2.description
   #3.ingredients
   #4.need to get user input
 end

end
