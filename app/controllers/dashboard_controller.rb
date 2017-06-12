class DashboardController < ApplicationController
  def index
    @users_count = User.count
    @users_with_books = User.joins(:books).group('users.id').count("DISTINCT user_id")
    @books = Book.count
    @books_availables = Book.availables.count
    @books_borrowed = @books - @books_availables
  end
end
