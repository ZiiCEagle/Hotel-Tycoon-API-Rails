# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  username: 'Grimmer',
  email: "grimmer@gmail.com",
  first_name: 'Grimmer',
  last_name: "Grimmer",
  password: "password",
  auth_token: "6031813070"
)

User.create(
  username: 'Ash',
  email: "ash@gmail.com",
  first_name: 'Ash',
  last_name: "Ash",
  password: "password",
  auth_token: "8154113283"
)

User.create(
  username: 'Timmer',
  email: "timmer@gmail.com",
  first_name: 'Timmer',
  last_name: "Timmer",
  password: "password",
  auth_token: "3167332618"
)
