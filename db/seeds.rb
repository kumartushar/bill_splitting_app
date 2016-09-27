# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: 'Amar', last_name: 'A', email: "amar@test.com")
User.create(first_name: 'Akbar', last_name: 'A', email: "akbar@test.com")
User.create(first_name: 'Anthony', last_name: 'A', email: "anthony@test.com")