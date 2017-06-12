class LoanBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_uniqueness_of :book_id

  after_save :borrow_book
  after_destroy :return_book

  scope :search_by_book, -> (book_id) { where(book_id: book_id) }

  def borrow_book
    book.update_attributes status: "borrowed"
  end

  def return_book
    book.update_attributes status: "available"
  end

end
