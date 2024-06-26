class DealershipsController < ApplicationController
    def index
        @dealerships = Dealership.all.order(created_at: :desc)
    end

    def show
        @dealership = Dealership.find(params[:id])
    end

    def new
    end

    def create
        @dealership = Dealership.new(
            name: params[:name],
            city: params[:city],
            review_rating: params[:review_rating],
            days_open: params[:days_open],
            military_discount: params[:military_discount]
            )
        @dealership.save
        redirect_to "/dealerships"

        # refactor for strong params
    end

    def edit
        @dealership = Dealership.find(params[:id])
    end

    def update
        @dealership = Dealership.find(params[:id])
        @dealership.update(
            name: params[:name],
            city: params[:city],
            review_rating: params[:review_rating],
            days_open: params[:days_open],
            military_discount: params[:military_discount]
        )
        @dealership.save
        redirect_to "/dealerships"
        # refactor for strong params
    end

    def destroy
        @dealership = Dealership.find(params[:id])
        @dealership.destroy
        redirect_to "/dealerships"
    end
end