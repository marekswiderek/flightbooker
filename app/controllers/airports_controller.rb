class AirportsController < ApplicationController
  before_action :authenticate_admin!, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  def index
    @airports = Airport.all

    respond_to do |format|
      format.html
      format.json { render json: @airports }
    end
  end

  def show
    @airport = Airport.find(params[:id])
  end

  def new
    @airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)

    if @airport.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @airport = Airport.find(params[:id])
  end

  def update
    @airport = Airport.find(params[:id])

    if @airport.update(airport_params)
      redirect_to action: :"index"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @airport = Airport.find(params[:id])
    @airport.destroy!

    redirect_to action: :index, turbo: false
  end

  private
  def airport_params
    params.require(:airport).permit(:airport_code, :name)
  end
end
