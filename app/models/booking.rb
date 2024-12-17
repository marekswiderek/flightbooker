class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  validates :flight_id, :passenger_id, presence: true
  validates :payment_verified, inclusion: { in: [true, false] }, presence: true
end
