class Book < ApplicationRecord
  has_many :loan_books
  has_many :users, through: :loan_books

  validates :author,
            :title,
            :summary,
            :status,
            presence: true

  validates :title, uniqueness: true
end
