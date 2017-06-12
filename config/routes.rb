Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :books
  resources :users
  resources :loan_books, only: [ :new, :create, :destroy]
  get 'return_book', to: "loan_books#return_book"

end
