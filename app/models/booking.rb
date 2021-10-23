class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :horse
  validates :from_date, :to_date, presence: true
end
