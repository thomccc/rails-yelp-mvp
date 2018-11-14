class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }, numericality: { only_integer: true }
  validates :rating, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false
end
