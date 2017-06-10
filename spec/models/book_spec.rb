require "rails_helper"

RSpec.describe Book, :type => :model do
  it "has a valid factory" do
    create(:book).should be_valid
  end

  it do
    should have_db_column(:status).
      with_options(default: "available")
  end


  context 'Validations' do
    before { build(:book) }

      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:author) }
      it { should validate_presence_of(:summary) }
      it { should validate_presence_of(:status) }
      it { should validate_uniqueness_of(:title) }

      it "is invalid without a title" do
        build(:book, title: nil).should_not be_valid
      end

      it "is invalid without a author" do
        build(:book, author: nil).should_not be_valid
      end

      it "is invalid without a summary" do
        build(:book, summary: nil).should_not be_valid
      end

  end


  context 'Associations' do
    it { should have_many(:users).through(:loan_books) }
    it { should have_many(:loan_books) }
  end

end
