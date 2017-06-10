require "rails_helper"

RSpec.describe LoanBook, :type => :model do

  context "Relations" do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end

  context "Uniqueness of book" do
    subject { FactoryGirl.build(:loan_book) }
    it { should validate_uniqueness_of(:book_id) }
  end
end
