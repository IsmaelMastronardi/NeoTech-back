User.destroy_all

Item.destroy_all
Category.destroy_all

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
    category: Category.all.sample,
    image: 'https://images.unsplash.com/photo-1624701928517-44c8ac49d93c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  )
end
