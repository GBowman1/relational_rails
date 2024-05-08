class DealershipsController < ApplicationController
    def index
        @dealerships = Dealership.all
    end
end