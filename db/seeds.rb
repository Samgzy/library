books = (1..70).map do
  Book.create!(
    title: Faker::Book.unique.title,
    author: Faker::Name.name,
    summary:    Faker::Lorem.paragraph
  )
end

users = (1..20).map do
  User.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    avatar: Faker::Placeholdit.image
  )
end
