# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
(1..10).each do
  Category.create(
    name:Faker::App.name,
    description:Faker::Alphanumeric.alpha(number: 5)
  )
end

categories = Category.all

(1..100).each do
  category = categories.sample

  Operation.create(
    amount: Faker::Number.within(range: 1..10000),
    odate: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now + 30, format: :default),
    description: Faker::Address.street_address,
    category_id: category.id
  )
end