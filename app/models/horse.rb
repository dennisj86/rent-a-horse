class Horse < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :horse_name, presence: true
  validates :speed, presence: true
  validates :height, presence: true
  validates :obedience, presence: true
end
