class Ninja < ApplicationRecord
  validates :name, :photo, :num_tel, :description, :address, presence: true
  validates :specialty, presence: true, inclusion: ["Kancho", "Onmitsudo", "Taijutsu", "Bukijutsu", "Tonjutsu"]

  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy, through: :reservations

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
