require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do
  name = Faker::Name.name
  age = rand(5..87)
  gender = Faker::Gender.binary_type
  location = "#{Faker::Address.latitude},#{Faker::Address.longitude}"

  Survivor.create!(name: name,
                   age: age,
                   gender: gender,
                   location: location)
end

8.times do
  name = Faker::Name.name
  age = rand(5..87)
  gender = Faker::Gender.binary_type
  location = "#{Faker::Address.latitude},#{Faker::Address.longitude}"

  Survivor.create!(name: name,
                   age: age,
                   gender: gender,
                   location: location,
                   abducted: true)
end
