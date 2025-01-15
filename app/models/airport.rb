class Airport < ApplicationRecord
  has_many :departure_flights, foreign_key: "departure_airport_id", class_name: "Flight"
  has_many :arrival_flights, foreign_key: "arrival_airport_id", class_name: "Flight"

  validates :airport_code, presence: true, uniqueness: true, length: { is: 3 }
  validates :name, presence: true, length: { minimum: 5, maximum: 30 }

  # def as_json(options = {})
  #   super({ only: [ :name, :airport_code ] }).merge(options)
  # end

  def as_json(_options = {})
    { name: self.name, airport_code: self.airport_code }
  end
end
