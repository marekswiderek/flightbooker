class Passenger < ApplicationRecord
  belongs_to :booking

  validates :name, :surname, length: { minimum: 2, maximum: 30 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
end
