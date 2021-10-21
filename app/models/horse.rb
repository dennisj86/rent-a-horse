class Horse < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :horse_name, :speed, :height, :obedience presence: true
end
