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
     Scraper.scraper_category
     Category.all.each.with_index(1) do |list, index|
       puts "#{index}. #{list.title}"
     end
     select_number
   elsif input == "exit"
     goodbye
   else
     list_category
   end
 end

 def select_number
   puts "Please type the number you are interested in or type exit: "
   input = gets.strip
   if input.to_i <= Category.all.size && input.to_i > 0
     index = input.to_i-1
     category_title = Category.all.map{|category| category.title}
     @user_select = category_title[index]
     puts "You selected #{input}.#{@user_select}!"
     display_link
   elsif
     input == "exit"
     goodbye
   elsif
     input.to_i == 0 || input.to_i > Category.all.size
     puts "Invalid number"
     select_number
   end
 end

 def display_link
   puts "Would you like to open link to see more details? [y/n]"
   input = gets.strip
   if input.downcase == "yes" ||  input.downcase == "y"
     puts "Here you go!!"
     Category.all.each do |list|
       if @user_select == list.title
         system("open #{list.url}")
       end
     end
   else
     goodbye
   end
 end

 def goodbye
   puts "Thanks for visiting my project!!!"
 end

end
