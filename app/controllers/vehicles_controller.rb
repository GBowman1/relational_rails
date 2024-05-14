class VehiclesController < ApplicationController
    def index
        @vehicles = Vehicle.all
    end

    def show
        @vehicle = Vehicle.find(params[:id])
    end

    def edit
        @vehicle = Vehicle.find(params[:id])
    end

    def update
        @vehicle = Vehicle.find(params[:id])
        @vehicle.update(vehicle_params)
        @vehicle.save
        redirect_to "/vehicles/#{@vehicle.id}"
    end

    private
    def vehicle_params
        params.require(:vehicle).permit(:pre_owned, :electric, :price, :year, :horsepower, :make, :model, :img_url)
    end
end