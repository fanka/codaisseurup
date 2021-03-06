# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
User.destroy_all
Registration.delete_all

business = Category.create(name:"Business")
leisure = Category.create(name:"Leisure")
active = Category.create(name:"Active")
outdoor = Category.create(name:"Outdoor")
indoor = Category.create(name:"Indoor")
free = Category.create(name:"Free")
paid = Category.create(name:"Paid")

test_user = User.create(email: "test_user@gmail.com", password: "abcd1234")

photo1 = Photo.create(remote_image_url:
"http://res.cloudinary.com/fanka/image/upload/v1496054937/IMG_1266Porche-event_pknqfd.jpg")
photo2 = Photo.create(remote_image_url:
"http://res.cloudinary.com/fanka/image/upload/v1496054934/hwc7_fcuksq.jpg")
photo3 = Photo.create(remote_image_url:
"http://res.cloudinary.com/fanka/image/upload/v1496054940/concreat-goldparty-brusselsairport-np-128_ltg50s.jpg")
photo4 = Photo.create(remote_image_url:
"http://res.cloudinary.com/fanka/image/upload/v1496054837/cody-aulidge-194218_bhizvi.jpg")

event1 = Event.create!(name: "Some name",description: "Just an annual birthday",location: "Home",
price:35, capacity:10, includes_food:true, includes_drinks:true, starts_at:DateTime.new(2015,6,22,12,15,0,Rational(3,24)), ends_at:DateTime.new(2015,6,23,12,17,0,Rational(3,24)), active:true, user: test_user, categories: [leisure, paid], photos: [photo1, photo2])
event2 = Event.create!(name: "Office meeting",description: "Team dinner",location: "Office",
price:0, capacity:15, includes_food:true, includes_drinks:true, starts_at:DateTime.new(2015,6,22,12,15,0,Rational(3,24)), ends_at:DateTime.new(2015,6,23,12,17,0,Rational(3,24)), active:true, user: test_user, categories: [business, free], photos: [photo3, photo4])

Registration.create(event: event1, user: test_user, status: "active", price: 50, guest_count: 2)
