# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'csv'

puts "Importing products..."
CSV.foreach(Rails.root.join("products.csv"), headers: true) do |row|
    Product.create! do |product|
          product.id = row[0]
          product.name = row[1]
          product.description = row[2]
          product.sku = row[3]
          product.date = row[4]
          product.price = row[5]
          product.units = row[6]
          product.status = row[7]
          product.category = row[10]
    end
end
