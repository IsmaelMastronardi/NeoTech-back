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

categories = ['cases', 'mousepads', 'motherboards', 'monitors', 'powerSupplies', 'mice', 'laptops', 'keyboards', 'headphones', 'graphicsCards', 'chairs']

PRODUCT_CATEGORIES = {
  'cases' => [
    {'name' => 'Atnect NX 2092', 'image' => 'https://i.ibb.co/mNk50Dr/pc4.png'},
    {'name' => 'TechNova X1', 'image' => 'https://i.ibb.co/fnvyyzB/pc3.png'},
    {'name' => 'QuantumBlaze 5000', 'image' => 'https://i.ibb.co/svF3BFW/pc2.png'},
    {'name' => 'ElectraWave ZR', 'image' => 'https://i.ibb.co/bRnKQkQ/pc1.png'},
    {'name' => 'GalacticForce 3000', 'image' => 'https://i.ibb.co/FWN1SZg/pc2.png'},
    {'name' => 'InfinitySpark XT', 'image' => 'https://i.ibb.co/8grPkHk/pc-1.png'},
  ],
  'mousepads' => [
    {'name' => 'System Archelon Pad', 'image' => 'https://i.ibb.co/NrPTFc6/system-archelon-pad.png'},
    {'name' => 'SteelSeries QCK Mini', 'image' => 'https://i.ibb.co/RNdBCpW/steelseries-qck-mini.png'},
    {'name' => 'SteelSeries QCK', 'image' => 'https://i.ibb.co/KLzMH3g/steelseries-qck.png'},
    {'name' => 'Razer Inc. Mousepad', 'image' => 'https://i.ibb.co/9TMx5RC/razer-inc-mousepad.png'},
    {'name' => 'Razer Inc. Cloth Pad', 'image' => 'https://i.ibb.co/WVqnBJD/razer-inc-clot-pad.png'},
    {'name' => 'Mouse Mats Textil', 'image' => 'https://i.ibb.co/jf2XfCF/mouse-mats-textil.png'},
  ],  
  'motherboards' => [
    {'name' => 'TechPulse Z570', 'image' => 'https://i.ibb.co/4NzxzN2/motherboard5.png'},
    {'name' => 'GigaTech X450', 'image' => 'https://i.ibb.co/qghVpQh/motherboard4.png'},
    {'name' => 'IntelElite H310', 'image' => 'https://i.ibb.co/PGYBtZP/motherboard1.png'},
  ],  
  'monitors' => [
    {'name' => 'LG Roy Full HD 720', 'image' => 'https://i.ibb.co/qrZ6XqM/lg-roy-full-hd-720.png'},
    {'name' => 'Television Toshiba', 'image' => 'https://i.ibb.co/kGP4Gcc/television-toshiba.png'},
    {'name' => 'TechVision HD Pro', 'image' => 'https://i.ibb.co/N76mky0/monitor1.png'},
    {'name' => 'Liquid Crystal TV', 'image' => 'https://i.ibb.co/n1Fj1rf/liquid-crystal-tv.png'},
    {'name' => 'LCD Television LED', 'image' => 'https://i.ibb.co/L1sNFS0/lcd-television-led.png'},
  ],  
  'powerSupplies' => [
    {'name' => 'Thermaltake Smart Pro ATX 82', 'image' => 'https://i.ibb.co/8gMvrck/thermaltake-smart-pro-atx-82.png'},
    {'name' => 'Thermaltake Smart Pro ATX 80', 'image' => 'https://i.ibb.co/xC5g8CS/thermaltake-smart-pro-atx-80.png'},
    {'name' => 'Power Supply Unit 80 Plus', 'image' => 'https://i.ibb.co/zbytwt6/power-supply-unit-computer-cases-housings-80-plus.png'},
    {'name' => 'Power Supply Unit 80 Plus', 'image' => 'https://i.ibb.co/X5RZvxJ/power-supply-unit-80-plus.png'},
    {'name' => 'Fortron Hydro X 80 Plus', 'image' => 'https://i.ibb.co/tbq9b2m/fortron-hydro-x-80-plus.png'},
    {'name' => 'Hale82 V2 7-W PC Power Supply', 'image' => 'https://i.ibb.co/k8W5XTn/kisspng-power-supply-unit-hale82-v2-7-w-pc-power-supply-a-outstanding-pc-power-connector-pinout-gall.png'},
  ],
  'mice' => [
    {'name' => 'Mad Catz R.A.T. 1', 'image' => 'https://i.ibb.co/ZMmw1mw/mad-catz-r-a-t-1.png'},
    {'name' => 'Ventus Z', 'image' => 'https://i.ibb.co/cbPsvxF/ventus-z.png'},
    {'name' => 'Razer DeathAdder', 'image' => 'https://i.ibb.co/K9qs4VF/razer-deathadder.png'},
    {'name' => 'Cougar 700M', 'image' => 'https://i.ibb.co/TPh7Vsy/mouse-cougar-700m.png'},
    {'name' => 'HyperX Pulsefire', 'image' => 'https://i.ibb.co/XxbdVjR/hyperx-pulsefire.png'},
    {'name' => 'Gamer Mouse Mats', 'image' => 'https://i.ibb.co/5LcddxS/gamer-mouse-mats.png'},
  ],  
  'laptops' => [
    {'name' => '2-in-1 PC Samsung Galaxy', 'image' => 'https://i.ibb.co/FgqdTk2/2-in-1-pc-samsung-galaxy.png'},
    {'name' => 'Lenovo Carbon', 'image' => 'https://i.ibb.co/5FFwZY3/lenovo-carbon.png'},
    {'name' => 'HP Pavilion', 'image' => 'https://i.ibb.co/K6JG8Qn/hp-pavilion.png'},
    {'name' => 'Acer Pixelbook', 'image' => 'https://i.ibb.co/F079yX7/acer-pixelbook.png'},
  ],  
  'keyboards' => [
    {'name' => 'Spirit of Gamer', 'image' => 'https://i.ibb.co/DWGYxzk/spirit-of-gamer-1.png'},
    {'name' => 'Razer Keyboard', 'image' => 'https://i.ibb.co/BNvrHS6/razer-keyboard1.png'},
    {'name' => 'Dell AW568 Alienware Advanced', 'image' => 'https://i.ibb.co/pQrstmM/dell-aw568-alienware-advanced-ga.png'},
  ],  
  'headphones' => [
    {'name' => 'Kingston HyperX Cloud II', 'image' => 'https://i.ibb.co/cTn21JZ/kingston-hyperx-cloud-ii.png'},
    {'name' => 'Spirit of Gamer Headset', 'image' => 'https://i.ibb.co/nmCtP1C/headset-spirit-of-gamer.png'},
    {'name' => 'Corsair Raptor HS30', 'image' => 'https://i.ibb.co/Bwq8m6z/corsair-raptor-hs30.png'},
  ],  
  'graphicsCards' => [
    {'name' => 'Radeon R9 290X', 'image' => 'https://i.ibb.co/hYvzysR/radeon-r9-290x-graphic-card.png'},
    {'name' => 'ASUS GeForce AMD R', 'image' => 'https://i.ibb.co/YkSRQy4/asus-geforce-amd-r-imodding-asus-rog-matrx-gtx.png'},
    {'name' => 'AMD Radeon RX 580', 'image' => 'https://i.ibb.co/80r0ff7/amd-radeon-rx-58-msi-geforce-gtx.png'},
    {'name' => 'AMD Radeon RX 550', 'image' => 'https://i.ibb.co/2tSHy3x/amd-radeon-rx-550-amd-radeon-400-series.png'},
    {'name' => 'AMD Radeon RX 200', 'image' => 'https://i.ibb.co/fMTmQbJ/amd-radeon-rx-200.png'},
  ],  
  'chairs' => [
    {'name' => 'DXRacer Gaming Chair', 'image' => 'https://i.ibb.co/Zdwg01T/gaming-chair-dxracer.png'},
  ],  
}

PRODUCT_CATEGORIES.each do |category, items|
  current_category = Category.create(name: category)
  items.each do |item|
    Item.create(
      name: item['name'],
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing
      elit. Phasellus malesuada dui a magna porta, faucibus sagittis odio
      scelerisque. Phasellus tincidunt enim quis erat tincidunt porta. Nullam
      sit amet quam rutrum nibh lobortis gravida quis mollis nisl. Nulla ante
      dolor, suscipit ut tortor nec, interdum dictum turpis',
      price: Faker::Commerce.price(range: 50.0..1000.0),
      quantity: rand(1..10),
      category: current_category,
      image: item['image']
    )
  end
end

