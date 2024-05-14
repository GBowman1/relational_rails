class Dealership < ApplicationRecord
    has_many :vehicles

    def alphabetical_order_make
        vehicles.order(:make)
    end

    def alphabetical_order_model
        vehicles.order(:model)
    end
end
