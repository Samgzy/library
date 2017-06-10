require "rails_helper"

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    create(:user).should be_valid
  end

  context 'Validations' do
    before { create(:user) }

      it { should validate_presence_of :firstname }
      it { should validate_presence_of :lastname }
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of(:email) }


      it "is invalid without a firstname" do
        build(:user, firstname: nil).should_not be_valid
      end

      it "is invalid without a lastname" do
        build(:user, lastname: nil).should_not be_valid
      end

      it "is invalid without a email" do
        build(:user, email: nil).should_not be_valid
      end


  end

  context 'Associations' do
    it { should have_many(:books).through(:loan_books) }
    it { should have_many(:loan_books) }
  end

end
