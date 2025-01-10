class AirportsController < ApplicationController
  before_action :authenticate_admin!, only: [ :index ]

  def index
    @airports = Airport.all
  end
end
