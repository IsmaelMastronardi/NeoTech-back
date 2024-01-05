# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password' # Set a default password for simplicity
  )
end

categories = ['Processors', 'Motherboards', 'Graphics Cards', 'Memory', 'Storage', 'Power Supplies', 'Cases', 'Cooling']

categories.each do |category_name|
  Category.create(name: category_name)
end

# Seed PC Hardware Items
20.times do
  Item.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price(range: 50.0..1000.0),
    image: 'not available',
    quantity: rand(1..10),
    category: Category.all.sample
  )
end
