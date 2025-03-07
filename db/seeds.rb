require 'faker'
require 'csv'

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

products.each do |product|
  category = Category.find_or_create_by(name: product["category_name"])
  category.products.create(
    title: product["title"],
    description: product["description"],
    price: product["price"],
    stock_quantity: product["stock_quantity"]
  )

676.times do
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    price: Faker::Commerce.price(range: 5..100),
    stock_quantity: Faker::Number.between(from: 1, to: 100)
  )
end

puts "Created #{Product.count} products."
puts "Created #{Category.count} categories and #{Product.count} products."
