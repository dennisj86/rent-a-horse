# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Horse.destroy_all
puts "Creating horse..."
bojack = {
  horse_name: 'Bojack',
  avatar: "84XxckNP_400x400_ynm3sv",
  speed: 7,
  height: 5,
  obedience: 'broken mind',
  user_id: 1
}

horse = Horse.create!(bojack)
puts "Created #{horse.horse_name}"
