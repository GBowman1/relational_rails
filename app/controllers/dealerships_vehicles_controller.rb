class DealershipsVehiclesController < ApplicationController
    def index
        # @vehicles = Dealership.find(params[:dealership_id]).vehicles
        @dealership = Dealership.find(params[:dealership_id])
    end

end