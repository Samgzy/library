class User < ApplicationRecord
  has_many :books, through: :loan_books
  has_many :loan_books

  validates :email,
            :firstname,
            :lastname,
            presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true
end
