# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'deleting previous flats'

Flat.destroy_all

puts 'creating sample flat'

Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3
)
puts 'creating faker flats'

3.times do
  Flat.create!(
    name: "#{Faker::House.room} in #{Faker::Address.city}",
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    price_per_night: (25..150).to_a.sample,
    number_of_guests: (1..6).to_a.sample
  )
end

puts 'finished!'
