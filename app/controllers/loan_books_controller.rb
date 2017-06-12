class LoanBooksController < ApplicationController

  def new
    @users = User.all
    @books = Book.availables
    @user = @users.search_by_email(params[:q]) unless params[:q].nil? || params[:q].empty?
    @loan_book = LoanBook.new
  end

  def create
    @loan_book = LoanBook.new(loan_book_params)
    if @loan_book.save
      flash[:notice] = "This book is now borrow "
      redirect_to action: 'new', q: @loan_book.user.email
    else
      redirect_to "loan_books/new"
    end
  end

  def destroy
  end

  private

  def loan_book_params
    params.require(:loan_book).permit(:user_id, :book_id)
  end

end
