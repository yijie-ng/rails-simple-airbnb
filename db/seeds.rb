# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'cleaning database...'
Flat.destroy_all

puts 'creating flats...'

4.times do
  flat = Flat.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph,
    price_per_night: rand(150..500),
    number_of_guests: rand(1..5)
  )
  puts "#{flat.id} is created."
end

puts 'finished!'
