5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
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
