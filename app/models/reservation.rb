class Reservation < ApplicationRecord
  belongs_to :ninja
  belongs_to :user

  has_many :reviews, dependent: :destroy
end
