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

diego = {
  horse_name: 'Diego',
  avatar: "vvkidawcdc0eziwx9bya",
  speed: 11,
  height: 5,
  obedience: 'old pony',
  user_id: 1
}
iwain = {
  horse_name: 'Sir Iwain',
  avatar: "qg2verikcaox3mdabepu",
  speed: 9,
  height: 5,
  obedience: 'great horse',
  user_id: 1
}

merlin = {
  horse_name: 'Merlin',
  avatar: "bojack-horseman-season-5-1024x576_a8pzg3",
  speed: 9,
  height: 5,
  obedience: 'MAAAGIC',
  user_id: 1
}
[diego, bojack, iwain, merlin].each { |horse|
  horses = Horse.create!(horse)
  puts "Created #{horses.horse_name}"
}
