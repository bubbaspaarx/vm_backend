# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Snack.destroy_all
Machine.destroy_all
Stock.destroy_all
Money.destroy_all

snacks = ["Mars Bar", "Snickers", "Toffee Crisp", "Double Decker",
  "Yorkie", "Walkers Cheese & Onion", "Doritos Cheesy", "Monster Munch",
  "Water 500ml", "Coca Cola", "Sprite", "Fanta Orange"]
images = ["http://www.stickpng.com/assets/images/58d2a68cdc164e9dd9e668ee.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/5b638c44777a427d380dec54-icon-256x256.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/59c77dd552ba0b1b681b6d91-icon-256x256.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/559d2c62777a424307009d0f-icon-256x256.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/543f0c7fc566d711790000ce-icon-256x256.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/59d472ff777a42161801f8e6-icon-256x256.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/59fc0b89777a4211b80271dd-icon-256x256.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/594f5d23777a4266db281c2f-icon-256x256.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/5b76b0a3e1272f17610fd1a0-icon-256x256.png",
  "http://icons.iconarchive.com/icons/musett/coca-cola/256/Coca-Cola-icon.png",
  "https://dtgxwmigmg3gc.cloudfront.net/files/5c092d5ce1272f579d01b02b-icon-256x256.png",
  "http://www.stickpng.com/assets/images/580b57fbd9996e24bc43c10a.png"]

one_p = Money.create(denomination: "1p", value: 1)
two_p = Money.create(denomination: "2p", value: 2)
five_p = Money.create(denomination: "5p", value: 5)
ten_p = Money.create(denomination: "10p", value: 10)
twenty_p = Money.create(denomination: "20p", value: 20)
fifty_p = Money.create(denomination: "50p", value: 50)
one_pound = Money.create(denomination: "£1", value: 100)
two_pound = Money.create(denomination: "£2", value: 200)



puts "Creating Snacks, machine, money and stock"

v = Machine.create(name: "Corner Shop VM")

Money.all.each do |m|
  MachineCash.create(quantity: 100, machine: v, money: m)
end

snacks.each_with_index do |snack, i|
  s = Snack.create(name: snack, price: rand(10..30) * 10, image: images[i])
  Stock.create(machine: v, snack: s, quantity: 20)
end

puts "EOF"
