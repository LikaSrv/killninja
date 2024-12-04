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

Ninja.destroy_all
User.destroy_all
puts "destroyed"

user1 = User.create!(email: "test@test.fr", password: "123456")
user2 = User.create!(email: "test01@test.fr", password: "123456")
puts "users done"

naruto = Ninja.new(name: "Naruto", address: "21 avenue Thiers, Nice", num_tel: "1234567890", specialty: "Kancho", description: "The main character of the series. He is a ninja from Konoha who dreams of becoming the Hokage.", user_id: user1.id)
sasuke = Ninja.new(name: "Sasuke", address: "14 avenue Jean Medecin, Nice", num_tel: "1234567890", specialty: "Onmitsudo", description: "A ninja from Konoha who is a member of the Uchiha clan. He is Naruto's rival.", user_id: user1.id)
sakura = Ninja.new(name: "Sakura", address: "32 Rue Trachel, Nice", num_tel: "1234567890", specialty: "Taijutsu", description: "A ninja from Konoha who is a member of Team 7. She is in love with Sasuke.", user_id: user2.id)

naruto_image_path=Rails.root.join('app', 'assets', 'images', 'Naruto.jpg')
naruto.photo.attach(io: File.open(naruto_image_path), filename: "naruto.jpg", content_type: "image/jpg")
naruto.save!


sasuke_image_path=Rails.root.join('app', 'assets', 'images', 'Sasuke.jpg')
sasuke.photo.attach(io: File.open(sasuke_image_path), filename: "sasuke.jpg", content_type: "image/jpg")
sasuke.save!

sakura_image_path=Rails.root.join('app', 'assets', 'images', 'Sakura.jpg')
sakura.photo.attach(io: File.open(sakura_image_path), filename: "sakura.jpg", content_type: "image/jpg")
sakura.save!

puts "End seeding ninjas"
