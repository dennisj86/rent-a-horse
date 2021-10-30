# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Horse.destroy_all
User.destroy_all
admin = {
  email: "admin@admin.com",
  first_name: "Admin",
  last_name: "istrator",
  password: '123456'
}
admins = User.create!(admin)
puts "Created #{admins.last_name}"
puts "Creating horse..."
bojack = {
  horse_name: 'Bojack',
  avatar: "84XxckNP_400x400_ynm3sv",
  address: "Winterfeldtstraße 48, 10781 Berlin",
  speed: 7,
  height: 5,
  obedience: 'Moody',
  user_id: admins.id
}

diego = {
  horse_name: 'Diego',
  avatar: "vvkidawcdc0eziwx9bya",
  address: "Winterfeldtstraße 2, 10781 Berlin",
  speed: 11,
  height: 5,
  obedience: 'Wild',
  user_id: admins.id
}
iwain = {
  horse_name: 'Sir Iwain',
  avatar: "qg2verikcaox3mdabepu",
  address: 'Winterfeldtstraße 20, 10781 Berlin',
  speed: 9,
  height: 5,
  obedience: 'Great',
  user_id: admins.id
}

merlin = {
  horse_name: 'Merlin',
  avatar: "bojack-horseman-season-5-1024x576_a8pzg3",
  address: 'Winterfeldtstraße 30, 10781 Berlin',
  speed: 9,
  height: 5,
  obedience: 'Great',
  user_id: admins.id
}

[diego, bojack, iwain, merlin].each { |horse|
  horses = Horse.create!(horse)
  puts "Created #{horses.horse_name}"
}
