class DealershipsVehiclesController < ApplicationController
    def index
        # @vehicles = Dealership.find(params[:dealership_id]).vehicles
        @dealership = Dealership.find(params[:dealership_id])
    end

    def new
        @dealership = Dealership.find(params[:dealership_id])
        @vehicle = Vehicle.new
    end

    def create
        @dealership = Dealership.find(params[:dealership_id])
        @vehicle = @dealership.vehicles.create(vehicle_params)
        redirect_to dealership_vehicles_path(@dealership)
    end

    # def edit
    #     @dealership = Dealership.find(params[:dealership_id])
    #     @vehicle = Vehicle.find(params[:id])
    # end

    # def update
    #     @dealership = Dealership.find(params[:dealership_id])
    #     @vehicle = Vehicle.find(params[:id])
    #     @vehicle.update(vehicle_params)
    #     redirect_to dealership_vehicles_path(@dealership)
    # end

    private
    def vehicle_params
        params.require(:vehicle).permit(:pre_owned, :electric, :price, :year, :horsepower, :make, :model, :img_url)
    end

end