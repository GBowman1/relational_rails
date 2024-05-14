class DealershipsVehiclesController < ApplicationController
    def index
        @dealership = Dealership.find(params[:dealership_id])
        @vehicles = @dealership.vehicles

        if params[:sort] == "make"
            @vehicles = @dealership.alphabetical_order_make
        elsif params[:sort] == "model"
            @vehicles = @dealership.alphabetical_order_model
        end

        if params[:min_year_search].present?
            @vehicles = @vehicles.min_year(params[:min_year_search])
        end
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

    private
    def vehicle_params
        params.require(:vehicle).permit(:pre_owned, :electric, :price, :year, :horsepower, :make, :model, :img_url)
    end

end