require 'faker'

Product.destroy_all

676.times do
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 5..100),
    stock_quantity: Faker::Number.between(from: 1, to: 100)
  )
end

puts "Created #{Product.count} products."
