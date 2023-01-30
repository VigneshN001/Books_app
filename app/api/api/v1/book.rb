require 'grape'
module API::V1

    class Book < Grape::API
      resource :book do
        desc "Create a book"
        params do
          requires :title, type: String
          requires :language, type: String
          requires :price, type: Float
          requires :author, type: String
          requires :isbn, type: String
        end
        post '/new' do 
                
          book = Book.new(title: params[:title], language: params[:language], price: params[:price], author: params[:author], isbn: params[:isbn]).save
          present book, with: API::V1::Entities::Book
        end

        
        

        desc "Update a book"
        params do
          requires :id, type: Integer
          optional :title, type: String
          optional :language, type: String
          optional :price, type: Float
          optional :author, type: String
          optional :isbn, type: String
        end
        put ':id' do
          book = Book.find(params[:id])
          book.update(title: params[:title], language: params[:language], price: params[:price], author: params[:author], isbn: params[:isbn])
          present book, with: API::V1::Entities::Book
        end

        desc "Delete a book"
        params do
          requires :id, type: Integer
        end
        delete ':id' do
          book = Book.find(params[:id])
          book.destroy
        end

        desc "Get book with highest price"
        get :highest_price do
          book = Book.order(price: :desc).first
          present book, with: API::V1::Entities::Book
        end

        desc "All book contents"
        
        get :all  do
         book = Book.get_all_book
         present book, with: API::V1::Entities::Book
        end

        desc "Get details of all books with a given author name"
        params do
          requires :author, type: String
        end
        
        get :by_author do
          books = Book.find_by_author(params[:author])
          present books, with: API::V1::Entities::Book
        end
      end
    end
  end




                  
            
    