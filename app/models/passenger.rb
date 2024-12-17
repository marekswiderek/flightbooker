class Passenger < ApplicationRecord
  self.primary_key = :passport_no

  has_many :bookings, :foreign_key => "passport_no"
  has_many :flights, through: :bookings

  validates :passport_no, uniqueness: { case_sensitive: false }, length: { is: 9 }
  validates :name, :surname, length: { minimum: 2, maximum: 30 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
end
