FactoryGirl.define do
  factory :user do
    firstname "John"
    lastname "Smith"
    email { "#{firstname}.#{lastname}@example.com".downcase }
  end
end
