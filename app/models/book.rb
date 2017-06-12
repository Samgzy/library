class Book < ApplicationRecord
  has_many :loan_books, dependent: :restrict_with_error
  has_many :users, -> { distinct }, through: :loan_books

  validates :author,
            :title,
            :status,
            presence: true

  validates :title, uniqueness: true

  scope :search_by_title, -> (title) { where("lower(title) LIKE :title", title: "%#{title.downcase}%") }
  scope :availables, -> { where status: "available" }

end
