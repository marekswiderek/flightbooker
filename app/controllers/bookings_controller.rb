class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:_chosen_flight_id])
    @booking = Booking.new
    params[:_passengers].to_i.times do
      @booking.passengers.build
    end
  end

  def create
    @flight = Flight.find(params[:_chosen_flight_id])
    @booking = Booking.new(booking_params)
    @booking.booking_value = @flight.price * params[:_passengers].to_i
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :booking_id, :name, :surname, :email ])
  end
end
