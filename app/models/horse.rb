class Horse < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  geocoded_by :address
  validates :horse_name, :speed, :height, :obedience, presence: true
  validates :speed, :height, numericality: true
  validates :obedience, acceptance: { accept: ['Wild', 'Moody', 'Great'] }
  after_validation :geocode, if: :will_save_change_to_address?

end
