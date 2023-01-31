require 'grape'
module API::V1

    class Library < Grape::API
      resource :library do

        desc "Create a book"
        params do
          requires :title, type: String
          requires :language, type: String
          requires :price, type: Float
          requires :author, type: String
          requires :isbn, type: String
        end

        post :new do 
                
          book = Book.new(params)
          if book.save
            {
              message: 'Book created'
            }
          else
            error!({
              message: book.errors.full_message.join(',')
            }, 400)
        end
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
          book = Book.find([:id])
          book = Book.update(title: params[:title], language: params[:language], price: params[:price], author: params[:author], isbn: params[:isbn])
         
        end
         desc "Get book with highest price"
        get 'highest_price' do
          book = Book.last
          return book.to_json
          
        end
        
        desc "All book contents"        
        get 'all'  do
         Book.all
         
        end

        desc "Get details of all books with a given author name"
        params do
          requires :author, type: String
        end
        
        get :by_author do
          books = Book.find_by_author(params[:author])
          
        end
        desc "Get a book"
        params do
          requires :id, type: Integer
          optional :title, type: String
          optional :language, type: String
          optional :price, type: Float
          optional :author, type: String
          optional :isbn, type: String
        end
        get ':id' do
          book = Book.find(params[:id])
          
        end
        desc "Delete a book"
        params do
          requires :id, type: Integer
        end
        delete ':id' do
          book = Book.find(params[:id])
          book.destroy
        end
        
       
      end
    end
  end




                  
            
    