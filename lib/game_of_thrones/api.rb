class API

    attr_reader :characters

    def initialize
        @books = make_books
        @characters = GameOfThronesApi.get_characters
    end    

    def make_books
        books = []
        GameOfThronesApi.get_books.each do |book| 
            books << Book.new(book)
        end    
        books
    end    

    def book_names
        @books.map{|book| book.name}
    end 

    def get_book(number)
        @books[number.to_i]  
    end 






end

