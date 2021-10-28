class Horse < ApplicationRecord
  has_many :bookings
  has_one_attached :photo
  belongs_to :user
  geocoded_by :address
  validates :horse_name, :speed, :height, :obedience, presence: true
  validates :speed, :height, numericality: true
  after_validation :geocode, if: :will_save_change_to_address?
end
