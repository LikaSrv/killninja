# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating ninjas..."

User.create!(email: "test@test.fr", password: "123456")
User.create!(email: "test01@test.fr", password: "123456")

Ninja.create!(name: "Naruto", address: "Konoha", num_tel: "1234567890", specialty: "Kancho", description: "The main character of the series. He is a ninja from Konoha who dreams of becoming the Hokage.", photo: "./app/assets/images/naruto.jpg", user_id: 1)
Ninja.create!(name: "Sasuke", address: "Konoha", num_tel: "1234567890", specialty: "Onmitsudo", description: "A ninja from Konoha who is a member of the Uchiha clan. He is Naruto's rival.", photo: "./app/assets/images/sasuke.jpg", user_id: 1)
Ninja.create!(name: "Sakura", address: "Konoha", num_tel: "1234567890", specialty: "Taijutsu", description: "A ninja from Konoha who is a member of Team 7. She is in love with Sasuke.", photo: "./app/assets/images/sakura.jpg", user_id: 2)
puts "End seeding ninjas"
