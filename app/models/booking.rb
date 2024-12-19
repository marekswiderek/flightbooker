class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  accepts_nested_attributes_for :passengers

  validates :flight_id, :passenger_id, presence: true
  validates :payment_verified, inclusion: { in: [ true, false ] }, presence: true
end
