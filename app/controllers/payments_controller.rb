class PaymentsController < ApplicationController
  def show
    @booking = Booking.first
  end

  # Simulation for payment process
  # Bookings with payment_verified == false are deleted after 10 minutes
  def approve_payment
    @booking = Booking.find(params[:id])
      @booking.payment_verified = true
      if @booking.save
        redirect_to @booking
      else
        redirect_to root
      end
  end
end
