# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "Creating ninjas..."

Ninja.destroy_all
User.destroy_all
puts "destroyed"

user1 = User.create!(email: "test@test.fr", password: "123456")
user2 = User.create!(email: "test01@test.fr", password: "123456")
puts "users done"

naruto = Ninja.new(name: "Naruto", address: "21 avenue Thiers, Nice", num_tel: "1234567890", specialty: "Kancho", description: "Le personnage principal de la série. C'est un ninja de Konoha qui rêve de devenir Hokage.", user_id: user1.id, price: 100, rating: 5)
sasuke = Ninja.new(name: "Sasuke", address: "14 avenue Jean Medecin, Nice", num_tel: "1234567890", specialty: "Onmitsudo", description: "
Un ninja de Konoha membre du clan Uchiha. C'est le rival de Naruto.", user_id: user1.id, price: 200, rating: 4)
sakura = Ninja.new(name: "Sakura", address: "32 Rue Trachel, Nice", num_tel: "1234567890", specialty: "Taijutsu", description: "
Une ninja de Konoha qui fait partie de l'équipe 7. Elle est amoureuse de Sasuke.", user_id: user2.id, price: 150, rating: 3)

# naruto_image_path=Rails.root.join('app', 'assets', 'images', 'naruto.jpg')
naruto_image_path = URI.open("https://res.cloudinary.com/dsbteudoz/image/upload/v1733305520/Dream_TradingCard_33_eywihx.jpg")
naruto.photo.attach(io: naruto_image_path, filename: "naruto.jpg", content_type: "image/jpg")
naruto.save!


# sasuke_image_path=Rails.root.join('app', 'assets', 'images', 'Sasuke.jpg')
sasuke_image_path = URI.open("https://res.cloudinary.com/dsbteudoz/image/upload/v1733305520/Dream_TradingCard_32_ofse18.jpg")
sasuke.photo.attach(io: sasuke_image_path, filename: "sasuke.jpg", content_type: "image/jpg")
sasuke.save!

# sakura_image_path=Rails.root.join('app', 'assets', 'images', 'Sakura.jpg')
sakura_image_path = URI.open("https://res.cloudinary.com/dsbteudoz/image/upload/v1733305520/Dream_TradingCard_30_j8wydx.jpg")
sakura.photo.attach(io: sakura_image_path, filename: "sakura.jpg", content_type: "image/jpg")
sakura.save!

puts "End seeding ninjas"
