# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Article.destroy_all

10.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.username, firstname: Faker::Name.first_name, lastname: Faker::Name.last_name)
end

30.times do
  a = Article.create(title: Faker::Tea.variety, content: Faker::Lorem.paragraph_by_chars(number: 256), user: User.all.sample())
  a.image.attach(io: File.open('/home/septentrion/Images/Test/real_estate_test5.jpeg'), filename: 'poster.jpeg')
end
