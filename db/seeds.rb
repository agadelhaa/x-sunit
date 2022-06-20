# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

survivors = [
  { name: "Tribore Menendez",
    age: 37,
    gender: "male",
    location: "35.77591,170.82958",
    abducted: false },

  { name: "Little Cato",
    age: 15,
    gender: "male",
    location: "24.07978,18.10662",
    abducted: false },

  { name: "Quinn Airgone",
    age: 27,
    gender: "female",
    location: "22.33151,70.48523",
    abducted: false },

  { name: "Gary Goodspeed",
    age: 26,
    gender: "male",
    location: "-2.80607,13.11580",
    abducted: false }
]

survivors.each do |survivor|
  Survivor.find_or_create_by!(survivor)
end
