class RenameDealershipsIdColumnInVehicles < ActiveRecord::Migration[7.1]
  def change
    rename_column :vehicles, :dealerships_id, :dealership_id
  end
end
