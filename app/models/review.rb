class Review < ApplicationRecord
  belongs_to :reservation

  validates :content, :score, presence: true
end
