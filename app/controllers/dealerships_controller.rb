class DealershipsController < ApplicationController
    def index
        @dealerships = Dealership.all.order(created_at: :desc)
    end

    def show
        @dealership = Dealership.find(params[:id])
    end
end