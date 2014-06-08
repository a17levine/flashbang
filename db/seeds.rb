# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


alex = User.create(email:"a17levine@gmail.com",first_name:"Alex", last_name:"Levine", password:"password", password_confirmation: "password")
alexander = User.create(email:"alex@makersquare.com",first_name:"Alexander", last_name:"Levine", password:"password", password_confirmation: "password")
flashbang_guy = User.create(email:"flashbangapp@gmail.com",first_name:"Flash", last_name:"Bang", password:"password", password_confirmation: "password")
