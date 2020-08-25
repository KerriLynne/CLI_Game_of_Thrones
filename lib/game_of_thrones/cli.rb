class CLI
 

    def self.start
        system("clear")
        puts "Welcome to A Song of Ice and Fire (GOT) books app!".cyan.bold  
        input = nil
        while input != "yes" && input != "y"
            puts "Please type yes to explore all of A Song of Ice and Fire books, type no or exit to leave our app!".red.bold
            input = gets.strip.downcase
            if input == "no" || input == "n" || input == "exit"
                system("clear")  
                puts "Please come back for more infomation on A Song of Ice and Fire books. Goodbye!".yellow.on_blue.bold
                break
            elsif input == "yes" || input == "y"
                list_books    
            else
                puts "Not sure what you're looking for...".blue.bold 
            end   
        end    
    end

    def self.list_books
        input = nil
        puts "List of all GOT books:".green.bold
        API.book_names.each.with_index(1) do |book, i|
            puts "#{i}. #{book}"
        end  
        pick_a_book
    end   


    def self.pick_a_book
        input = nil
        while input != "exit"
            puts "Type the number of the book you want to explore! Or type exit.".yellow.bold 
            input = gets.strip.downcase

            if input.to_i > 0
                system("clear")  
                getting_info
                display_options(input.to_i-1)
                break
            elsif input == "exit"
                system("clear")
                puts "Please come back for more infomation on A Song of Ice and Fire books. Goodbye!".yellow.on_blue.bold
            else
                puts "That doesnt match our books, please try again.".blue.bold 
            end     
        end 
    end 

    def self.display_book_info(number) 
        book = API.get_book(number) 
        character_numbers = get_character_numbers(book["povCharacters"])
        characters = API.get_all_characters
    
        puts "Book Name: ".red.bold
        puts book["name"]
        puts ""
        puts "Characters: ".blue.bold
        character_numbers.each {|number| puts characters[number -1]["name"]}
        puts ""
        puts "Author(s): ".cyan.bold
        puts book["authors"]
        puts ""
        puts "Release Date: ".yellow.bold
        puts Date.parse(book["released"])
        puts ""  
        puts "Publisher: ".green.bold
        puts book["publisher"]
        puts ""
        puts "Media Type: ".magenta.bold
        puts book["mediaType"]
        puts ""
    end    


    def self.get_character_numbers(characters)
        characters.map {|character| character.split("/")[-1].to_i}
    end 


    def self.display_options(number) 
        book = API.get_book(number) 
        character_numbers = get_character_numbers(book["povCharacters"])
        characters = API.get_all_characters


            puts "What option would you like displayed for #{book["name"]}? Type list to see the list of books again.".yellow.bold  #was input
            puts "Characters".white.bold
            puts "Author(s)".white.bold
            puts "Release Date".white.bold
            puts "Publisher".white.bold
            puts "Media Type".white.bold
            puts "All info".white.bold
            puts "Back to main menu".white.bold
            input = gets.strip.downcase

            system("clear")
            if input == "character" || input == "characters"
                puts"Characters: ".blue.bold
                character_numbers.each {|number| puts characters[number -1]["name"]} 
                puts ""
                display_options(number) 
            elsif input == "author" || input == "authors"
                puts "Author(s): ".blue.bold
                puts book["authors"]
                puts ""
                display_options(number) 
            elsif input == "release" || input == "released" || input == "release date" 
                puts "Release Date".blue.bold
                puts Date.parse(book["released"])
                puts ""  
                display_options(number)  
            elsif input == "publisher" || input == "publish" || input == "p" 
                puts "Publisher".blue.bold
                puts book["publisher"]
                puts ""  
                display_options(number)  
            elsif input == "media type" || input == "media"
                puts "Media Type".blue.bold
                puts book["mediaType"]
                puts ""  
                display_options(number)  
            elsif input == "all info" || input == "all" || input == "info"
                puts ""
                display_book_info(number) 
                puts "Pick another book you want to get info on!".cyan.bold
                list_books
            elsif input == "list" 
                list_books
            elsif input == "back to main menu" || input == "main menu" || input == "menu"
                puts ""
                start
            elsif input == "exit"
                puts "Please come back for more infomation on A Song of Ice and Fire books. Goodbye!".yellow.on_blue.bold
            else
                puts "Not sure what you're looking for...".blue.bold
                pick_a_book
            end     
    end           

    def self.getting_info
        puts "getting your information!".magenta.bold
        3.times do 
            sleep(0.25)
            puts ""
        end
        puts "in 3 ...".magenta.bold
        sleep(1)
        puts "in 2 ...".magenta.bold
        sleep(1)
        puts "in 1 ...".magenta.bold
        sleep(0.25)
    end    
      

    class String
        def black;          "\e[30m#{self}\e[0m" end
        def red;            "\e[31m#{self}\e[0m" end
        def green;          "\e[32m#{self}\e[0m" end
        def brown;          "\e[33m#{self}\e[0m" end
        def blue;           "\e[34m#{self}\e[0m" end
        def magenta;        "\e[35m#{self}\e[0m" end
        def cyan;           "\e[36m#{self}\e[0m" end
        def gray;           "\e[37m#{self}\e[0m" end
        
        def bg_black;       "\e[40m#{self}\e[0m" end
        def bg_red;         "\e[41m#{self}\e[0m" end
        def bg_green;       "\e[42m#{self}\e[0m" end
        def bg_brown;       "\e[43m#{self}\e[0m" end
        def bg_blue;        "\e[44m#{self}\e[0m" end
        def bg_magenta;     "\e[45m#{self}\e[0m" end
        def bg_cyan;        "\e[46m#{self}\e[0m" end
        def bg_gray;        "\e[47m#{self}\e[0m" end
        
        def bold;           "\e[1m#{self}\e[22m" end
        def italic;         "\e[3m#{self}\e[23m" end
        def underline;      "\e[4m#{self}\e[24m" end
        def blink;          "\e[5m#{self}\e[25m" end
        def reverse_color;  "\e[7m#{self}\e[27m" end
    end


end    
  