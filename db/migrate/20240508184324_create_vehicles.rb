class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.boolean :pre_owned
      t.boolean :electric
      t.integer :price
      t.integer :year
      t.integer :horsepower
      t.string :make
      t.string :model
      t.string :img_url

      t.timestamps
    end
  end
end
