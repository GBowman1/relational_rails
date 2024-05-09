class DealershipsVehiclesController < ApplicationController
    def index
        @vehicles = Dealership.find(params[:dealership_id]).vehicles
        # nested resources research more
        # finds all children belonging to a parent
    end

end