class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  validates :departure_airport_id, :arrival_airport_id, :departure_time, :duration, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
