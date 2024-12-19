class AddBookingValueToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :booking_value, :decimal, precision: 9, scale: 2
  end
end
