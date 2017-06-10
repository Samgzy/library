FactoryGirl.define do
  factory :loan_book do
    association :user
    association :book
  end
end
