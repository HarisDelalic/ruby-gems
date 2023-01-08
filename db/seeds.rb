# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'test@test.com', password: 'Password1')

user.add_role :admin
user.skip_confirmation!

30.times do
  Course.create(title: Faker::Educator.course_name,
                description: Faker::Lorem.paragraph(sentence_count: 2),
                user_id: User.last.id,
                short_description: Faker::Quote.famous_last_words,
                language: Faker::ProgrammingLanguage.name,
                level: 'All Levels',
                price: Faker::Number.between(from: 1000, to: 20000))
end