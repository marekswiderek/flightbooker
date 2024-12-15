# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[["WMI", "Warsaw Modlin"], ["BGY", "Milan Bergamo"], ["ZAG", "Zagreb"], ["RZE", "Rzeszów-Jasionka"]].each do |airport|
  Airport.find_or_create_by!(airport_code: airport[0], name: airport[1])
end

Airport.ids.combination(2).each do |departure_airport_id, arrival_airport_id|
  Flight.create!(departure_airport_id: departure_airport_id,
                            arrival_airport_id: arrival_airport_id,
                            departure_time: rand(DateTime.now..DateTime.now + 1.month).change(usec:0, sec:0),
                            duration: Time.at(rand(Time.now.change(hour: 0, min: 30)..Time.now.change(hour: 12, min: 0))).change(sec: 0, usec:0),
                            price: (rand(1000000)+4000)/100.0
                            )
end
