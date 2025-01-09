class Booking < ApplicationRecord
  before_create :set_defaults

  scope :payment_expired, -> { where("created_at <= ? and payment_verified is not true", 10.minutes.ago) }

  belongs_to :flight
  has_many :passengers, inverse_of: :booking, dependent: :destroy

  accepts_nested_attributes_for :passengers

  validates :flight_id, :booking_value, presence: true

  private
  def set_defaults
    self.payment_verified = false
  end
end
