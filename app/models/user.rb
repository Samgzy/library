class User < ApplicationRecord
  has_many :loan_books, dependent: :restrict_with_error
  has_many :books, through: :loan_books

  validates :email,
            :firstname,
            :lastname,
            presence: true

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  scope :search_by_email, -> (email) { where("lower(email) LIKE :email", email: "%#{email.downcase}%") }

  def to_s
    "#{firstname} #{lastname}"
  end

end
