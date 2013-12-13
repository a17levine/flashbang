# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email:"a@a.com",first_name:"Shehzan", last_name:"Devani", password:"11111111", password_confirmation: "1"*8)

User.create(email:"b@b.com",first_name:"Alex", last_name:"Levine", password:"11111111", password_confirmation: "1"*8)

User.create(email:"c@c.com",first_name:"Charlotte", last_name:"Giles", password:"11111111", password_confirmation: "1"*8)
