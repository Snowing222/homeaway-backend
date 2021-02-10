# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Listing.delete_all

elsa = User.create(name:"elsa", email:"elsa@gmail.com", password:"elsa")
p1 = elsa.properties.create(
                      description:"Nice houes by the beach, great for family", 
                      guest_number: 10, 
                      bedroom_number:4, 
                      bathroom_number:2,
                      address:"111 laketown dr",
                      state: "FL",
                      zipcode: 10001)
p2 = elsa.properties.create(
                        description:"Clean and modern design, close to everything", 
                        guest_number: 4, 
                        bedroom_number:2, 
                        bathroom_number:1,
                        address:"100 dr apt 201",
                        state: "NY",
                        zipcode: 10002)


l1 = p1.listings.create(
                        title: "Bright spacious house available in March! ",
                        price:1000, 
                        avail_date_begin:Date.today+10,
                        avail_date_end:Date.today+50, 
                        avail_period:10,  
                        strict_mode: false, 
                        rent_mode: true, 
                        trade_mode: false)

l2 = p2.listings.create(    
                            title: " Beach house available in June! ",
                            price:800, 
                            avail_date_begin:Date.today+100,
                            avail_date_end:Date.today+120, 
                            avail_period:10,  
                            strict_mode: false, 
                            rent_mode: true, 
                            trade_mode: false)