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

User.destroy_all
Ninja.destroy_all
puts "destroyed"

user1 = User.create!(email: "test@test.fr", password: "123456")
user2 = User.create!(email: "test01@test.fr", password: "123456")
puts "users done"

naruto = Ninja.new(name: "Naruto", address: "Konoha", num_tel: "1234567890", specialty: "Kancho", description: "The main character of the series. He is a ninja from Konoha who dreams of becoming the Hokage.", user_id: user1.id)
p "naruto done"
sasuke = Ninja.new(name: "Sasuke", address: "Konoha", num_tel: "1234567890", specialty: "Onmitsudo", description: "A ninja from Konoha who is a member of the Uchiha clan. He is Naruto's rival.", user_id: user1.id)
p "sasuke done"
sakura = Ninja.new(name: "Sakura", address: "Konoha", num_tel: "1234567890", specialty: "Taijutsu", description: "A ninja from Konoha who is a member of Team 7. She is in love with Sasuke.", user_id: user2.id)
p "sakura done"

naruto_file = File.open(Rails.root.join('app/assets/images/naruto.jpg'))
sasuke_file = File.open(Rails.root.join('app/assets/images/sasuke.jpg'))
sakura_file = File.open(Rails.root.join('app/assets/images/sakura.jpg'))
p "file path done"

naruto.photo.attach(io: file, filename: "naruto.jpg", content_type: "image/jpg")
naruto.photo.attach(io: file, filename: "naruto.jpg", content_type: "image/jpg")
naruto.save
p "naruto photo done"
sasuke.photo.attach(io: file, filename: "sasuke.jpg", content_type: "image/jpg")
sasuke.save
p "sasuke photo done"
sakura.photo.attach(io: file, filename: "sakura.jpg", content_type: "image/jpg")
sakura.save
p "sakura photo done"

puts "End seeding ninjas"
