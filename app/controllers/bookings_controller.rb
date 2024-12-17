class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:_chosen_flight_id])
  end

  def create
    @booking = Booking.new(booking_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id)
  end
end
