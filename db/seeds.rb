# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(name: 'Admin',  email: 'admin@user.com',  password: 'verypassword')

Employee.create(name: 'John',  email: 'employee@user.com',  password: 'verypassword')

restaurant_1 = Restaurant.create(name: 'pizza',  email: 'pizza@user.com',  password: 'verypassword')
restaurant_2 = Restaurant.create(name: 'kitchen',  email: 'kitchen@user.com',  password: 'verypassword')

Menu.create(restaurant_id: restaurant_1.id, meals: 'pizza', date: Time.zone.now.to_date)
Menu.create(restaurant_id: restaurant_2.id, meals: 'pancakes', date: Time.zone.now.to_date)
