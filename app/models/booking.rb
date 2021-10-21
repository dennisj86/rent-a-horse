class Booking < ApplicationRecord
  validates :user_id, :horse_id, presence: true
  belongs_to :horse, :user
end
