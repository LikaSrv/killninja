class Reservation < ApplicationRecord
  belongs_to :ninja
  belongs_to :user
end
