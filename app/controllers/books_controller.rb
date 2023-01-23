class BooksController < ApplicationController
 def index
		@books = Book.all.order("created_at DESC")
 end
  def create
   book = Book.new(book_params)
   if book.save
     render json: {status: 'Success', message: 'Book created successfully', data: book}, status: :ok
   else
     render json: {status: 'Error', message: 'Book not created', data: book.errors}, status: :unprocessable_entity
   end
 end
 def show 
    book = Book.find(params[:id])
    render json: {status: 'Success',message: 'Book found',data:book}, status: :ok
 end
 def update
   book = Book.find(params[:id])
   if book.update_attributes(book_params)
     render json: {status: 'Success', message: 'Book updated successfully', data: book}, status: :ok
   else
     render json: {status: 'Error', message: 'Book not updated', data: book.errors}, status: :unprocessable_entity
   end
 end
 
 def destroy
   book = Book.find(params[:id])
   book.destroy
   render json: {status: 'Success', message: 'Book deleted successfully'}, status: :ok
 end
 
 def highest_price
   book = Book.order("price DESC").first
   render json: {status: 'Success', message: 'Book with highest price', data: book}, status: :ok
 end
 
 def by_author
   books = Book.where(author: params[:author])
   render json: {status: 'Success', message: 'Books by author', data: books}, status: :ok
 end
 
 private
 def book_params
   params.permit(:title, :language, :price, :author, :isbn)
 end



end