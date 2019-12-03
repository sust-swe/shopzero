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

#Create Brands

(1..10).each {
  Brand.create!(name: Faker::Restaurant.unique.name)
}

#Create Categories

(1..10).each {
  Category.create!(name: Faker::Restaurant.unique.type)
}

#Create Products

(1..5).each do |i|
  (1..2).each do |j|
    (1..10).each do |k|
      Product.create!(
        name: Faker::Food.dish, brand_id: k, category_id: (j * k) % 10 + 1,
        sales_price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        retail_price: Faker::Number.decimal(l_digits: 2, r_digits: 2),
        stock: 100,
        picture: Rails.root.join("app/assets/images/404.jpg").open,
      )
    end
  end
end

#Create Users

(1..50).each do |i|
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
