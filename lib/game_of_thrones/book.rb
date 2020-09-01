class Book
    def initialize
        @name = name
        @characters = characters
        @author = author
        @release_date = release_date
        @publisher = publisher
        @media_type = media_type
        @books = GameOfThronesApi.get_books
        book.new
    end

    def self.get_books
        @books.map |info| do 
            Book.new(info)
        end 
    end
    
    def book_names
        @books.map{|book| book["name"]}
    end

    def get_book(number)
        @books[number.to_i]  
    end 


end
