class Ninja < ApplicationRecord
  validates :name, :photo, :num_tel, :description, :address, presence: true
  validates :specialty, presence: true, inclusion: ["Kancho", "Onmitsudo", "Taijutsu", "Bukijutsu", "Tonjutsu"]

  has_many :reservations, dependent: :destroy
end
