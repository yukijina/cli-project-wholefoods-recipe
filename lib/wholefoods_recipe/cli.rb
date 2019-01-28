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
     category= Category.all.map{|list| list.title}
     puts "You selected #{input}. #{category[index]}!"
     Recipe.all.each do |list|
       if list.title == category[index].strip
         list_details
       end
     end

   elsif
     input == "exit"
     goodbye
   elsif
     input.to_i == 0
     list
   end
 end

 def list_details
   binding.pry
   puts "Please type recipe name you like: "
   input = gets.strip
   puts "You selected #{input}"
   Recipe.all.each do |list|
     if list.name.downcase == input.downcase
       system("open #{a=list.url}")
     end
   end
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
