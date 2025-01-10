class BookingJob < ApplicationJob
  queue_as :default

  # Job that deletes all expired bookings (there are 10 minutes for each booking since creation to be paid for)
  def perform
    expired_bookings = Booking.payment_expired.count
    Booking.payment_expired.destroy_all
    puts "Destroyed #{expired_bookings} expired bookings."
  end
end
