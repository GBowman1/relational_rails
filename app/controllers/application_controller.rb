class ApplicationController < ActionController::Base
    def index
        @vehicles = Vehicle.all
    end
end
