class AddVehiclesToDealerships < ActiveRecord::Migration[7.1]
  def change
    add_reference :vehicles, :dealerships, foreign_key: true
  end
end
