class API


    def self.book_names
        GameOfThronesApi.get_books.map{|book| book["name"]}
    end

    def self.get_book(number)
        GameOfThronesApi.get_books[number.to_i]  
    end    

    def self.get_all_characters
        GameOfThronesApi.get_characters
    end   


end

