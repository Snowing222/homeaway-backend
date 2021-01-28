# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Listing.delete_all

elsa = User.create(name:"elsa", email:"elsa@gmail.com")
l1 = elsa.listings.create(price:1000, avail_date_begin:Date.today+10, avail_date_end:Date.today+50, avail_period:10, address:"100w 13, New York", zipcode: 10023, strict_mode: false, rent_mode: true, trade_mode: false, description:"Nice houes by the beach, great for family", guest_number: 10, bedroom_number:4, bathroom_number:2)