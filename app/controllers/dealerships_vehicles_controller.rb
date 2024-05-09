class DealershipsVehiclesController < ApplicationController
    def index
        @vehicles = Dealership.find(params[:dealership_id]).vehicles
    end

end