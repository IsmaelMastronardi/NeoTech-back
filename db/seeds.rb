OrderItem.destroy_all
Order.destroy_all
User.destroy_all

Item.destroy_all
Category.destroy_all

5.times do
  User.create(
    name: Faker::Name.name,
  )
end

categories = ['Notebooks', 'Desktop', 'Processors', 'Motherboards', 'Graphics Cards', 'Memory', 'Storage', 'Power Supplies', 'Cases', 'Cooling', 'Accessories']

categories.each do |category_name|
  Category.create(name: category_name)
end

# Seed PC Hardware Items
20.times do
  Item.create(
    name: Faker::Commerce.product_name,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
    Phasellus malesuada dui a magna porta, faucibus sagittis odio scelerisque. 
    Phasellus tincidunt enim quis erat tincidunt porta. 
    Nullam sit amet quam rutrum nibh lobortis gravida quis mollis nisl. 
    Nulla ante dolor, suscipit ut tortor nec, interdum dictum turpis',
    price: Faker::Commerce.price(range: 50.0..1000.0),
    quantity: rand(1..10),
    category: Category.all.sample,
    image: 'https://i.ibb.co/FWN1SZg/pc2.png'
  )
end
