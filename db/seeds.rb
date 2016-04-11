# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = Movie.create([
    {title: "Harry Potter", description: "boy has scar and is powerful", runtime: 120, genre: "fantasy"},
    {title: "Deadpool", description: "Superhero Movie", runtime: 125, genre: "Comedy"}
  ])