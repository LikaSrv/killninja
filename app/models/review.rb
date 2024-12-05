class Review < ApplicationRecord
  belongs_to :ninja

  validates :content, :score, presence: true
end
