# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Question.delete_all

10.times do
  User.create!(
    username: Faker::Internet.username,
    email: 'bmpitzen@icloud.com',
    password: '123'
  )
end

10.times do
  Question.create!(
    title: Faker::NewGirl.character,
    body: Faker::NewGirl.quote,
    user: User.all.sample
  )
end

10.times do
  Answer.create!(
    body: Faker::PrincessBride.quote,
    user: User.all.sample,
    question: Question.all.sample
  )
end
