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
  avatar: "horse-1.jpg",
  address: "Winterfeldtstraße 48, 10781 Berlin",
  speed: 7,
  height: 5,
  obedience: 'broken mind',
  user_id: admins.id
}

diego = {
  horse_name: 'Diego',
  avatar: "horse-2.jpg",
  address: "Winterfeldtstraße 2, 10781 Berlin",
  speed: 11,
  height: 5,
  obedience: 'old pony',
  user_id: admins.id
}
iwain = {
  horse_name: 'Sir Iwain',
  avatar: "horse-3.jpg",
  address: 'Winterfeldtstraße 20, 10781 Berlin',
  speed: 9,
  height: 5,
  obedience: 'great horse',
  user_id: admins.id
}

merlin = {
  horse_name: 'Merlin',
  avatar: "horse-4.jpg",
  address: 'Winterfeldtstraße 30, 10781 Berlin',
  speed: 9,
  height: 5,
  obedience: 'MAAAGIC',
  user_id: admins.id
}

[diego, bojack, iwain, merlin].each { |horse|
  horses = Horse.create!(horse)
  puts "Created #{horses.horse_name}"
}
