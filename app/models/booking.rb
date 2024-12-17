class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  accepts_nested_attributes_for :passenger

  validates :flight_id, :passenger_id, presence: true
  validates :payment_verified, inclusion: { in: [ true, false ] }, presence: true
end
