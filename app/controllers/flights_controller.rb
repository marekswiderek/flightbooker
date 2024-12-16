class FlightsController < ApplicationController
  def index
    @airports_options = Airport.all.map { |a | [ a.airport_code, a.id ] }

    # checking presence of params[:departure_time] because it is only field that has no value by default
    if params[:departure_time].present?
      @flights = find_flights(params)
    else
      @flights = find_flights(nil)
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def find_flights(find_flights_params)
    if find_flights_params.nil?
      @flights = Flight.none
    else
      # TO-DO: add departure_time and number of passengers parameters handling
      @flights = Flight.where(departure_airport_id: find_flights_params[:departure_airport_id],
                              arrival_airport_id: find_flights_params[:arrival_airport_id])
    end
  end
end
