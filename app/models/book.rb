class Book < ApplicationRecord
    self.table_name="books"
    def self.create_book(params)
        book = Book.new(params)
        return book

    end
    
    def self.get_all_book
        book = Book.all
        return book
    end
end
