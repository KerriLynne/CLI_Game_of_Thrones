class Book
    attr_reader :name, :authors, :released, :publisher, :mediaType, :pov_characters

    def initialize(book)
        @name = book["name"]
        @authors = book["authors"]
        @released = book["released"]
        @publisher = book["publisher"]
        @mediaType = book["mediaType"]
        @pov_characters = book["povCharacters"]
    end










end
