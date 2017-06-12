Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :books
  resources :users
  resources :loan_books
end
