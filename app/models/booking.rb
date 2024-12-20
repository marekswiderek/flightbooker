class Booking < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :flight
  has_many :passengers, inverse_of: :booking, dependent: :destroy

  accepts_nested_attributes_for :passengers

  validates :flight_id, :booking_value, presence: true
  validates :payment_verified, inclusion: { in: [ true, false ] }

  private
  def set_defaults
    self.payment_verified = false
  end
end
