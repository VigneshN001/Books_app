module BooksAPI
    version 'v1', using: :path
    format :json

    class API < Grape: :API

        desc"Create a book"
        params do
            requires :title,type: String, desc: "Book Title"
            requires :language,type: String, desc: "Book language"
            requires :price,types: String, desc: "Book Price"
            requires :author,type: String,desc: "Book Author"
            reuires :isbn,type: String,desc: "Book ISBN number"
        end
        post do
            book = Book.new(declared(params))
            if book.save{
                status: 'Success',message: 'Book created successfully',data: book

            }
            else
                {
                    status: 'Error',message: 'Book not created',data: book.errors

                }
            end
        end

        desc"Update a book"
        params do  
            requires :id,type: Integer, desc: "Book ID"
            requires :title,type: String, desc: "Book title"
            requires :price,types: String, desc: "Book Price"
            requires :author,type: String,desc: "Book Author"
            reuires :isbn,type: String,desc: "Book ISBN number"

        end
        put ':id' do
            book = Book.find(params[:id])
            if book.update_attributes(declared(params))
                {
                    status: 'Success',message: 'Book uodated successfully',data: book

            }
            else
                {
                    status: 'Error',message: 'Book not Found',data: book

                }
            end
        end
        
        resource :books do
        desc"Books By Author"
        params do
            require :author,type: String,desc: "Author name"
        end
        get 'by_author' do
            books = Book.where(author: params[:author])
            if books.present?
                {
                    status: 'Success', message: 'Books found', data: books
                                
                
                }
            else
                {
                    status: 'Error',message: 'Books not found'
                }
            end
        end
        
        desc "Find the book with the highest price"
        get'highest_price' do
            book = Book.order(price: :desc).first
            if book.present?
                {
                    status: 'Success',message: 'Book found',data: book
                }
            else{
                status: 'Error',message: 'Book not found'

            }
        end
    end
end
end

                  
            
    