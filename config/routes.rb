Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post 'books', to: 'books#create'
  get 'books/:id/edit', to: 'books#edit'
  delete 'books/:id', to: 'books#destroy'
  get 'books/highest_price', to: 'books#highest_price'
  get 'books/author/:author', to: 'books#by_author'

  mount BooksAPI => '/api' do
    post 'books', to: 'books#create'
    put 'books/:id', to: 'books#update'
    delete 'books/:id', to: 'books#destroy'
    get 'highest_price', to: 'books#highest_price'
    get 'by_author/:author', to: 'books#by_author'
  end
end


