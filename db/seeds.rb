require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Admin
Admin.create!(email: "ishan.bn14@gmail.com", password: "123456")
Admin.create!(email: "tushitatahsin@gmail.com", password: "123456")

#Create Brands

Brand.create!(name: "KUMO Creations")
Brand.create!(name: "Brheez")
Brand.create!(name: "Reusables")
Brand.create!(name: "Sawdust City")

#Create Categories

Category.create!(name: "Cutlery")
Category.create!(name: "Crockeries")
Category.create!(name: "Recyclers")
Category.create!(name: "Containers")

#Create Products
Product.create!(
  name: "Compostable Wooden Spoons",
  brand_id: "1",
  category_id: "1",
  sales_price: "128",
  retail_price: "125",
  stock: 100,
  picture: Rails.root.join("app/assets/images/wooden_set.jpg").open,
  features: "Cillum sint nostrud incididunt.;Lorem ipsum voluptate laboris velit pariatur consectetur.;Labore dolore ea.;Deserunt dolore do ut nisi.",
  description: "Labore sint irure sunt esse aliquip culpa est pariatur consectetur laboris laboris et nulla ad cillum cupidatat aliquip laborum nulla aliqua sint dolor cillum laboris ad.",
)

Product.create!(
  name: "Disposable Bamboo Style Square Bowls 5.5' (16oz)",
  brand_id: "2",
  category_id: "2",
  sales_price: "20",
  retail_price: "18",
  stock: 100,
  picture: Rails.root.join("app/assets/images/disposable_bowl_bhreez.jpg").open,
  features: "Cillum sint nostrud incididunt.;Lorem ipsum voluptate laboris velit pariatur consectetur.;Labore dolore ea.;Deserunt dolore do ut nisi.",
  description: "Labore sint irure sunt esse aliquip culpa est pariatur consectetur laboris laboris et nulla ad cillum cupidatat aliquip laborum nulla aliqua sint dolor cillum laboris ad.",
)
Product.create!(
  name: " Tilt-Out Garbage Bin (Solid - Red) ",
  brand_id: "4",
  category_id: "3",
  sales_price: "120",
  retail_price: "110",
  stock: 100,
  picture: Rails.root.join("app/assets/images/tilt_out_trash_can.jpg").open,
  features: "Cillum sint nostrud incididunt.;Lorem ipsum voluptate laboris velit pariatur consectetur.;Labore dolore ea.;Deserunt dolore do ut nisi.",
  description: "Labore sint irure sunt esse aliquip culpa est pariatur consectetur laboris laboris et nulla ad cillum cupidatat aliquip laborum nulla aliqua sint dolor cillum laboris ad.",
)

Product.create!(
  name: "Hydro Flask Water Bottle - Stainless Steel & Vacuum Insulated",
  brand_id: "3",
  category_id: "4",
  sales_price: "20",
  retail_price: "18",
  stock: 100,
  picture: Rails.root.join("app/assets/images/hydro_flusk.jpg").open,
  features: "Cillum sint nostrud incididunt.;Lorem ipsum voluptate laboris velit pariatur consectetur.;Labore dolore ea.;Deserunt dolore do ut nisi.",
  description: "Labore sint irure sunt esse aliquip culpa est pariatur consectetur laboris laboris et nulla ad cillum cupidatat aliquip laborum nulla aliqua sint dolor cillum laboris ad.",
)

# (1..5).each do |i|
#   (1..2).each do |j|
#     (1..10).each do |k|
#       Product.create!(
#         name: Faker::Food.dish, brand_id: k, category_id: (j * k) % 10 + 1,
#         sales_price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
#         retail_price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
#         stock: 100,
#         picture: Rails.root.join("app/assets/images/404.jpg").open,
#       )
#     end
#   end
# end

#Create Users

(1..10).each do |i|
  User.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: "test#{i}@shopzero.com",
    username: "test#{i}",
    password: "123456",
    password_confirmation: "123456",
    activated: true,
    activated_at: Time.now,
  )
end

(1..4).each do |product|
  (1..5).each do |user|
    Order.create!(product_id: product, user_id: user, order_no: user, count: 5, delivered: true)
    Review.create!(product_id: product, user_id: user,
                   title: "Lorem ipsum ex in sunt ut.",
                   rating: 5,
                   body: "Lorem ipsum commodo ut adipisicing mollit irure irure anim consequat ullamco id culpa mollit eiusmod exercitation irure proident aute amet ut ullamco voluptate in nisi enim officia ut occaecat ut mollit esse in cupidatat enim excepteur ad ex aliqua aute.")
  end
end
