# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Brands

Brand.create!(name: "Aarong")
Brand.create!(name: "Pran")
Brand.create!(name: "Shezan")
Brand.create!(name: "Fresh")
Brand.create!(name: "Nestle")
Brand.create!(name: "Teer")

#Create Categories

Category.create!(name: "Milk")
Category.create!(name: "Juice")
Category.create!(name: "Food")

#Create Products

Product.create!(name: "Dairy Milk",brand_id:1,category_id:1)
Product.create!(name: "Dairy Milk",brand_id:2,category_id:1)
Product.create!(name: "Mango Juice",brand_id:2,category_id:2)
Product.create!(name: "Chocolate Milk Juice",brand_id:1,category_id:2)
Product.create!(name: "Chocolate Milk Juice",brand_id:1,category_id:2)
Product.create!(name: "Mango Milk Shake",brand_id:1,category_id:2)