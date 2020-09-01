class API

    def initialize
        @books = GameOfThronesApi.get_books
        @characters = GameOfThronesApi.get_characters
    end    


    def book_names
        @books.map{|book| book["name"]}
    end

    def get_book(number)
        @books[number.to_i]  
    end    

    def get_all_characters
        @characters
    end   


end

