class Horse < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :horse_name, :speed, :height, :obedience, presence: true
  validates :speed, :height, numericality: true
  has_one_attached :photo
end
