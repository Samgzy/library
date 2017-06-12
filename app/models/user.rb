class User < ApplicationRecord
  has_many :loan_books, dependent: :restrict_with_error
  has_many :books, through: :loan_books

  validates :email,
            :firstname,
            :lastname,
            presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true

  scope :search_by_email, -> (email) { where("lower(email) LIKE :email", email: "%#{email.downcase}%") }

  def to_s
    "#{firstname} #{lastname}"
  end

end
