class LoanBooksController < ApplicationController
  before_action :load_books, only: [ :return_book ]

  def new
    @users = User.all
    @books = Book.availables
    @user = @users.search_by_email(params[:q]) unless params[:q].nil? || params[:q].empty?
    @loan_book = LoanBook.new
  end

  def create
    @loan_book = LoanBook.new(loan_book_params)
    if @loan_book.save
      flash[:notice] = "This book is now borrow"
      redirect_to action: 'new', q: @loan_book.user.email
    else
      flash[:alert] = "Something went wrong"
      redirect_to "loan_books/new"
    end
  end

  def return_book
    @book = @books.where(title: params[:q]).first
    @loan_book = LoanBook.search_by_book(@book).first
  end

  def destroy
    @loan_book = LoanBook.find params[:id]
    if @loan_book.destroy
      flash[:notice] = "This book is now available"
      redirect_to action: "return_book"
    else
      flash[:alert] = "Didn't find this book"
    end
  end

  private

  def load_books
    @books = Book.borrowed
  end

  def loan_book_params
    params.require(:loan_book).permit(:user_id, :book_id)
  end

end
