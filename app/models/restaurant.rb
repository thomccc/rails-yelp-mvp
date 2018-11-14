class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates_associated :reviews
  validates :name, uniqueness: true, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian),
  message: "%{value} is not a valid category" }

end
